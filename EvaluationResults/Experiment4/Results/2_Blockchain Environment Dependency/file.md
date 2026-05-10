| Contract Name | GPT Oss 120b | GPT Oss 20b API | GPT Oss 20b Local | Grok 4.1 fast non-reasoning | Grok 4.1 fast reasoning | Devstral | Magistral Medium | Magistral 24b API | Devstral Small API | Magistral 24b Local | Devstral Small Local | Qwen3 235b thinking | Qwen3 30b thinking API | Qwen3 235b instruct | Qwen3 30b instruct API | DeepSeek Chat | DeepSeek Reasoner | DeepSeek R1 14b Local |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| TimestampDependencyFixed | TN | TN | TN | FP | FP | TN | TN | TN | FP | FP | FP | FP | FP | TN | FP | FP | FP | TN |
| TimestampDependency | TP | FN | FN | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | TP | FN | TP | FN |
| TransactionOrderDependencyFixed | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN |
| TransactionOrderDependencyHashFixed | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN |
| TransactionOrderDependencyHash | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN |
| TransactionOrderDependency | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN |
| BadRandomNumberGenFixed | TN | TN | TN | FP | FP | FP | FP | TN | TN | TN | TN | FP | TN | FP | TN | FP | TN | TN |
| BadRandomNumberGen | FN | FN | TP | TP | TP | TP | FN | FN | FN | FN | TP | TP | TP | FN | FN | TP | TP | FN |
| BlockVariableDependencyFixed | FP | TN | FP | FP | FP | FP | TN | TN | TN | TN | TN | FP | TN | TN | FP | FP | TN | TN |
| BlockVariableDependency | FN | FN | TP | TP | TP | TP | TP | FN | FN | FN | FN | TP | TP | TP | TP | TP | TP | TP |
| ImproperPrivateVariableSecretFixed | TN | TN | TN | FP | TN | FP | FP | FP | TN | TN | TN | FP | FP | FP | FP | FP | TN | TN |
| ImproperPrivateVariableSecretMinimalFixed | TN | TN | TN | TN | TN | FP | TN | TN | FP | TN | TN | TN | TN | FP | FP | FP | TN | TN |
| ImproperPrivateVariableSecretMinimal | FN | FN | FN | FN | FN | TP | TP | TP | TP | TP | TP | FN | FN | TP | FN | FN | TP | FN |
| ImproperPrivateVariableSecret | FN | FN | FN | FN | TP | TP | FN | FN | TP | FN | FN | TP | TP | TP | FN | FN | FN | FN |
| UnpredictableStateDynamicLibrariesFixed | TN | TN | FP | FP | FP | TN | TN | TN | TN | TN | TN | TN | TN | FP | FP | FP | TN | TN |
| UnpredictableStateDynamicLibraries | TP | FN | FN | TP | TP | FN | FN | FN | FN | TP | FN | FN | FN | FN | FN | FN | TP | TP |
| BlockhashDependencyFixed | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN | TN |
| BlockhashDependency | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN | FN |
