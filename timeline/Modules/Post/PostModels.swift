//
//  PostModels.swift
//  timeline
//
//  Created by pattarapol sawasdee on 13/10/2562 BE.
//  Copyright (c) 2562 pattarapol. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Post
{
  // MARK: Use cases
  
  enum Post
  {
    struct Request
    {
    }
    struct Response
    {
      let title: String
      let time: String
      let photoList: [String]
    }
    struct ViewModel
    {
      let title: String
      let time: String
      let photoList: [String]
    }
  }

  enum FullImage {
    struct Request
    {
      let index: Int
    }
    struct Response
    {
      let imageUrl: String
    }
    struct ViewModel
    {
      let imageUrl: String
    }
  }
}
