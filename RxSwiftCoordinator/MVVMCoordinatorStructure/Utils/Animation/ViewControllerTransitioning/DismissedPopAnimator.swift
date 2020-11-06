//
//  DismissedPopAnimator.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 thanh tien. All rights reserved.
//

import Foundation
import UIKit

class FadePopAnimator: CustomAnimator {
    
    init(type: TransitionType,
                duration: TimeInterval = 0.22,
                interactionController: UIPercentDrivenInteractiveTransition? = nil) {
        super.init(type: type, duration: duration)
    }

    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromViewController = transitionContext.viewController(forKey: .from)
            else {
                return
        }
        
        if type == .navigation, let toViewController = transitionContext.viewController(forKey: .to) {
            transitionContext.containerView.insertSubview(toViewController.view, belowSubview: fromViewController.view)
        }

        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            fromViewController.view.alpha = 0
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}


