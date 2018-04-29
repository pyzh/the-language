#lang scribble/manual
@require[@for-label[racket]]

@title{語}
@author{zaoqi}

@defmodule[lang #:lang #:packages ("lang")]

@define-syntax-rule[(重名詞法 名 原) @define-syntax-rule[(名 . 參) (原 . 參)]]

@重名詞法[述機 defproc]
@重名詞法[語 racket]
@重名詞法[述 defform]
@重名詞法[述/子 defform/subs]
@重名詞法[述值 defthing]

@section{形式}
@述[(#%式 式 甲 ...)]{等價與使用@語[:機.用]和@語[→:式-1]。使用一個@語[引機？]@語[式]。可以寫作@語[{式 甲 ...}]。}
@述[(#%頂 名)]{頂層的物。}
@述[(機 形 ...)]{等價與使用@語[:機.用]。}

@section{物}
@subsection{結構/值}
@subsubsection{機}
@語[(→:機 '<形> '((#%頂 <名>) . <形>))]

@subsection{述}
@述機[(等？ [甲 (非 :誤？)] [乙 (非 :誤？)]) :陰-陽？]{返回@語[甲]是否等於@語[乙]。}
@述機[(算 [物 :物？] [集/定 :集/定？]) :物？]
@述機[(取 [:名 名？]) :物？]{獲取一個包}
@述機[(或 [甲 :物？] [乙 :物？]) :物？]{一般是@語[甲]，可以是@語[乙]。}

@subsubsection{陰-陽}
@述機[(:陰-陽？ [:物 (非 :誤？)]) :陰-陽？]
@述值[陰:陰-陽 :陰-陽？]
@述值[陽:陰-陽 :陰-陽？]
@述機[(:陰陽.若 [:物 陰-陽？] [甲 :物？] [乙 :物？]) :物？]{若@語[陰陽]是@語[陽]，則返回@語[乙]，否則返回@語[丙]。}

@subsubsection{列}
@述機[(:列/構？ [:物 (非 :誤？)]) :陰-陽？]
@述機[(→:列/構 [首 :物？] [尾 :物？]) :列/構？]
@述機[(:列/構.首 [:物 :列/構？]) :物？]
@述機[(:列/構.尾 [:物 :列/構？]) :物？]
@述機[(:列/空？ [:物 (非 :誤？)]) :陰-陽？]
@述值[:列/空 列/空？ #:value ()]

@subsubsection{名}
@述機[(:名/文？ [:物 (非 :誤？)]) :陰-陽？]

@述機[(:名/構？ [:物 (非 :誤？)]) :陰-陽？]
@述機[(→:名/構 [:名 :物？] [:列 :物？]) :名/構？]{@語[:名]一般是@語[:名]。@語[:列]一般是@語[:列]。}
@述機[(:名/構.:名 [:物 :名/構？]) :物？]
@述機[(:名/構.:列 [:物 :名/構？]) :物？]

@subsubsection{集/定}
@述機[(:集/定？ [:物 (非 :誤？)]) :陰-陽？]
@述值[空:集/定 :集/定？]
@述機[(:集/定.增 [:物 :集/定？] [名 :物？] [甲 :物？]) :集/定？]{原來沒有，是增。}
@述機[(:集/定.改 [:物 :集/定？] [名 :物？] [:機 (-> :物？ :物？)]) :集/定？]
@述機[(:集/定.取 [:物 :集/定？] [名 :物？]) :物？]
@述機[(:集/定.含？ [:物 :集/定？] [名 :物？]) :陰-陽？]
@述機[(:集/定.删 [:物 :集/定？] [名 :物？]) :集/定？]{必須有，才能刪。}
@述機[(:集/定→:列 [:物 :集/定？]) (listof (list/c any/c any/c))]

@subsubsection{機}
@述機[(:機？ [:物 (非 :誤？)]) :陰-陽？]
@述機[(→:機 [形 :物？] [:物 :物？]) :機？]{@語[形]類似Scheme,不是@語[:列]的當成@racket[symbol?]。}
@述機[(:機.形 [:物 :機？]) :物？]
@述機[(:機.物 [:物 :機？]) :物？]
@述機[(:機.用 [:物 :機？] [形 :物？]) :物？]{如果@語[形]和@語[:物]不能匹配，這個@語[誤？]是@語[形]產生的。}

@subsubsection{式}
@述機[(:式？ [:物 (非 :誤？)]) :陰-陽？]
@述機[(→:式 [:機 :物？]) :式？]{@語[機]一般是@語[(-> :集/定？ :物？ ... :物？)]。}
@述機[(→:式-1 [:物 :式？]) :物？]

@subsubsection{構}
@述機[(:構？ [:物 (非 :誤？)]) :陰-陽？]
@述機[(->:構 [:名 :物？] [:列 :物？]) :構？]{@語[:名]一般是@語[:名]，@語[:列]一般是@語[:列]。}
@述機[(:構.:名 [:物 :構？]) :物？]
@述機[(:構.:列 [:物 :構？]) :物？]

@subsubsection{誤}
@述機[(:誤？ [:物 :物？]) :陰-陽？]
@述機[(→:誤 [:物 :物？]) :誤？]
@述機[(→:誤-1 [:物 :誤？]) :物？]

WIP
