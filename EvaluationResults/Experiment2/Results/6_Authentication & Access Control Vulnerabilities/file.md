| Contract Name | GPT Oss 120b | GPT Oss 20b API | GPT Oss 20b Local | Grok 4.1 fast non-reasoning | Grok 4.1 fast reasoning | Devstral | Magistral Medium | Magistral 24b API | Devstral Small API | Magistral 24b Local | Devstral Small Local | Qwen3 235b thinking | Qwen3 30b thinking API | Qwen3 235b instruct | Qwen3 30b instruct API | DeepSeek R1 14b Local | DeepSeek Chat | DeepSeek Reasoner |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| TransactionOriginAuth | TP | FN | TP | TP | TP | TP | FN | TP | TP | FN | TP | FN | FN | TP | FN | FN | TP | FN |
| TransactionOriginAuthFixed | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | FP | TN |
| UnprotectedTransferFixed | TN | TN | FP | TN | TN | TN | TN | TN | TN | TN | TN | FP | FP | TN | FP | FP | TN | TN |
| UnprotectedTransfer | TP | TP | TP | TP | TP | FN | TP | FN | FN | TP | FN | FN | FN | FN | TP | FN | FN | FN |
| SignatureMaleability | FN | FN | FN | TP | TP | TP | TP | FN | FN | FN | FN | TP | FN | TP | TP | FN | TP | TP |
| SignatureBasedVulnerabilityFixed | FP | FP | TN | FP | FP | TN | TN | TN | TN | FP | TN | TN | FP | FP | FP | FP | FP | TN |
| SignatureBasedVulnerability | TP | TP | TP | TP | TP | FN | FN | FN | FN | FN | FN | TP | TP | TP | TP | FN | TP | TP |
| SignatureMaleabilityFixed | TN | TN | TN | FP | FP | FP | TN | TN | TN | TN | TN | FP | TN | FP | FP | FP | FP | FP |
| DefaultAccessModifierVariableFixed | TN | TN | TN | FP | TN | TN | TN | TN | FP | TN | TN | FP | TN | TN | TN | TN | FP | TN |
| DefaultAccessModifierSimple | FN | FN | FN | FN | FN | TP | FN | FN | TP | FN | TP | FN | FN | FN | FN | FN | FN | FN |
| DefaultAccessModifierVariable | FN | FN | FN | TP | TP | FN | FN | FN | FN | FN | FN | TP | TP | TP | FN | FN | FN | FN |
| UnInitializedConditionStateVariable | TP | FN | FN | TP | TP | FN | TP | FN | FN | FN | FN | TP | FN | FN | TP | FN | TP | TP |
| DefaultAccessModifierSimpleFixed | FP | TN | TN | FP | FP | FP | TN | TN | TN | TN | FP | TN | TN | TN | TN | TN | TN | TN |
| UnInitializedConditionStateVariableFixed | TN | TN | TN | FP | TN | TN | TN | TN | FP | TN | TN | FP | TN | FP | FP | TN | FP | FP |
| UnprotectedSelfdestructFixed | TN | TN | FP | FP | TN | TN | FP | FP | FP | TN | TN | TN | TN | FP | FP | TN | FP | FP |
| UnprotectedSelfdestruct | TP | FN | TP | TP | TP | FN | TP | FN | FN | TP | FN | FN | TP | TP | TP | TP | TP | TP |
