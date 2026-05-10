| Contract Name | GPT Oss 120b | GPT Oss 20b API | GPT Oss 20b Local | Grok 4.1 fast non-reasoning | Grok 4.1 fast reasoning | Devstral | Magistral Medium | Magistral 24b API | Devstral Small API | Magistral 24b Local | Devstral Small Local | Qwen3 235b thinking | Qwen3 30b thinking API | Qwen3 235b instruct | Qwen3 30b instruct API | DeepSeek Chat | DeepSeek Reasoner | DeepSeek R1 14b Local |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| CallReturnValueNotChecked | FN | TP | TP | TP | TP | TP | TP | TP | TP | FN | TP | TP | TP | FN | TP | TP | TP | FN |
| CallReturnValueNotCheckedFixed | TN | TN | TN | TN | TN | FP | FP | TN | FP | TN | TN | TN | TN | TN | TN | TN | TN | TN |
| CallReturnValueNotCheckedHidden | FN | FN | TP | TP | TP | TP | TP | TP | TP | FN | FN | TP | TP | TP | FN | TP | TP | TP |
| CallReturnValueNotCheckedHiddenFixed | FP | TN | TN | FP | TN | FP | FP | FP | FP | TN | TN | TN | TN | TN | TN | FP | TN | TN |
| SendReturnValueNotChecked | FN | FN | TP | TP | TP | TP | FN | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | FN |
| SendReturnValueNotCheckedFixed | FP | TN | TN | TN | TN | TN | TN | TN | FP | FP | FP | TN | TN | TN | TN | FP | TN | TN |
| SendReturnValueNotCheckedHidden | TP | FN | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP |
| SendReturnValueNotCheckedHiddenFixed | FP | TN | TN | TN | TN | FP | FP | FP | FP | FP | FP | TN | TN | TN | FP | FP | FP | FP |
| SendReturnValueNotCheckedInconsistent | TP | FN | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP |
| SendReturnValueNotCheckedInconsistentFixed | TN | TN | FP | FP | FP | FP | FP | FP | FP | FP | FP | TN | TN | TN | FP | FP | TN | TN |
| ValueNotChecked | FN | FN | TP | TP | TP | FN | TP | FN | TP | TP | TP | FN | FN | TP | FN | TP | TP | FN |
| ValueNotCheckedFixed | TN | TN | TN | FP | FP | TN | TN | TN | TN | FP | FP | TN | TN | FP | TN | TN | TN | TN |
| MishandledOutOfGasException | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | TP | FN | TP | FN |
| MishandledOutOfGasExceptionFixed | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | FP | TN | TN | TN |
