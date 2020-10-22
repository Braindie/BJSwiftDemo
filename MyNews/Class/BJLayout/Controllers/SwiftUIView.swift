//
//  SwiftUIView.swift
//  MyNews
//
//  Created by zhangwenjun on 2019/10/24.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    @available(iOS 13.0.0, *)
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text("我是SwiftUI，哈哈哈哈")
                .font(.title)
                .foregroundColor(.green)
            HStack {
                Text("副标题")
                    .font(.subheadline)
                Text("hahaha")
                    .font(.subheadline)
                    .foregroundColor(.orange)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        SwiftUIView()
    }
}
