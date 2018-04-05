#lang scribble/manual
@require[@for-label[racket]]

@(require scribble/decode)
@(require racket)
@(define (subsubsubsection . args)
   (match (apply subsubsection args)
     [(part-start depth tag-prefix tags style title)
      (part-start (+ 1 depth) tag-prefix tags style title)]))

@title{語}
@author{zaoqi}

@defmodule[lang #:lang #:packages ("lang")]

@define-syntax-rule[(重名詞法 名 原) @define-syntax-rule[(名 . 參) (原 . 參)]]

@重名詞法[述機 defproc]
@重名詞法[語 racket]
@重名詞法[述 defform]
@重名詞法[述/子 defform/subs]
@重名詞法[述值 defthing]

@section{物}
@述機[(等？ [甲 (非 誤？)] [乙 (非 誤？)]) 陰陽？]{返回@語[甲]是否等於@語[乙]。}

@述機[(首-尾？ [物 (非 誤？)]) 陰陽？]{返回@語[物]是否是@語[(首-尾 之首 之尾)]。}
@述機[(首-尾 [首 物？] [尾 列？]) 首尾？]{沒有強制類型限制。}
@述機[(首-尾.首 [物 首-尾？]) 物？]{若@語[物]是@語[(首-尾 之首 之尾)]，返回@語[之首]。}
@述機[(首-尾.尾 [物 首-尾？]) 物？]{若@語[物]是@語[(首-尾 之首 之尾)]，返回@語[之尾]。}
@述機[(空？ [物 (非 誤？)]) 陰陽？]{返回@語[物]是否是@語[()]。}
@述值[空 空？ #:value ()]

@述機[(文？ [物 (非 誤？)]) 陰陽？]{返回@語[物]是否是字符。}

@述機[(名/文？ [物 (非 誤？)]) 陰陽？]
@述機[(名/文 [物 (列 文？)]) 名-文？]{沒有強制類型限制。}
@述機[(名/文-1 [物 名/文？]) (列 文？)]{沒有強制類型限制。}
@述機[(名/構？ [物 (非 誤？)]) 陰陽？]
@述機[(名/構 [名 名？] [列 列？]) 陰陽？]{沒有強制類型限制。}
@述機[(名/構.名 [物 名/構？]) 名？]{沒有強制類型限制。}
@述機[(名/構.列 [物 名/構？]) 列？]{沒有強制類型限制。}
@述機[(名？ [物 (非 誤？)]) 陰陽？]

@述機[(集/定？ [物 (非 誤？)]) 陰陽？]
@述值[集/定/空 集/定？]
@述機[(集/定.增 [物 集/定？] [名 物？] [物 物？]) 映？]
@述機[(集/定.改 [物 集/定？] [名 物？] [機 (-> 物？ 物？)]) 映？]
@述機[(集/定.增-改 [物 集/定？] [名 物？] [物 物？]) 映？]{返回創建或修改了的@語{集/定}。}
@述機[(集/定.取 [物 集/定？] [名 物？]) 物？]
@述機[(集/定.含？ [物 集/定？] [名 物？]) 陰陽？]
@述機[(集/定.删 [物 集/定？] [名 物？]) 映？]{必須有，才能刪。}
@述機[(集/定→列 [物 集/定？]) (listof (cons/c any/c any/c))]

@述[(！式 甲 ...)]{使用一個@語[引機？]。可以寫作@語[{甲 ...}]。}

@述機[(機？ [物 (非 誤？)]) 陰陽？]
@述機[(機 [形 物？] [物 未算？]) 機？]{沒有強制類型限制。}
@述機[(用 [物 機？] [形 物？]) 物？]{
 用@語[形]應用@語[機]。
 @語[(算 (機.物 機) 境)]。
 @語[境]只包含用@語[機.形]和@語[形]得到的。

 如果@語[形]和@語[機]不能匹配，這個@語[誤？]是@語[形]產生的。
}
@述機[(機.形 [物 機？]) 物？]{
 類似Scheme。
}
@述機[(機.物 [物 機？]) 未算？]

@述值[列 機？ #:value (機 '(列) '列)]

@述值[陰 陰陽？]
@述值[陽 陰陽？]
@述機[(陰陽.若 [物 陰-陽？] [乙 物？] [丙 物？]) 物？]{若@語[陰陽]是@語[陽]，則返回@語[乙]，否則返回@語[丙]。}

@述機[(式？ [物 (非 誤？)]) 陰陽？]
@述機[(式 [機 (-> 映？ 未算？ ... 物？)]) 式？]{
 沒有強制類型限制。
 first-class的宏和特殊形式。
}
@述機[(式-1 [物 式？]) (-> 映？ 未算？ ... 物？)]{沒有強制類型限制。}

@述值[引 引機？ #:value (式 (機 '(集/定 物) '物))]

@述機[(誤？ [物 物？]) 陰陽？]
@述機[(誤 [物 物？]) 誤？]
@述機[(誤-1 [物 誤？]) 物？]

@述機[(算 [物 未算？] [集/定 映？]) 物？]

@述值[集/定/頂 映？]

@述[{定 ([名 之物] ...) 物}]{@racket[letrec]}

@述機[(構？ [物 (非 誤？)]) 陰陽？]{返回@語[甲]是否是@語[(構 名 列)]。}
@述機[(構 [名 名？] [列 列？]) 構？]{沒有強制類型限制。}
@述機[(構.名 [物 構？]) 物？]{若@語[甲]是@語[(構 名 列)]，返回@語[名]。}
@述機[(構.列 [物 構？]) 物？]{若@語[甲]是@語[(構 名 列)]，返回@語[列]。}

@述機[(取 [名 名？]) 物]{獲取一個包}

@section{誤}
@subsection{停機}
實現應該識別出儘量多的停機，改爲@語[(誤 (構 {引 誤/界/停} -未定義))]。@語[-未定義]是一個@語[物？]。
@subsection{內置}
@racket["沒有強制類型限制。"]在一些構建數據的@語[機？]中出現，表示特定的某些參數或返回值的類型可以是任何@語[物？]。
@語[(非 誤？)]表示不能是一個@語[誤？]，否則返回值是一個@語[誤？]。
@subsubsection{機}
內置的任何@語[機？]產生的@語[誤？]是@語[(誤 (構 {引 誤/界/機} (列 -名 -式 -位)))]。@語[-名]是它的名稱，@語[-式]是它的參數，@語[-位]是產生一個@語[誤？]的參數的名稱。
@subsubsubsection{算}
未定義時產生。。。（WIP）
@subsubsection{式}
內置的任何@語[式？]產生的@語[誤？]是@語[(誤 (構 {引 誤/界/式} (列 -名 -境 -式 -位)))]。@語[-名]是它的名稱，@語[-境]是環境，@語[-式]是它的參數，@語[-位]是參數的名稱。
