# LLM-Based Static Analysis for Smart Contracts - Supplemental Materials

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20109866.svg)](https://doi.org/10.5281/zenodo.20109866)

This repository contains supplemental materials for our LLM-based static-analysis experiments on smart contracts. It includes the full test suite used in the evaluation, the pre-computed vector embeddings for our vulnerability definitions, and the experimental outputs used for analysis and reproduction.
The associated technical report is included in this repository under `TechnicalReport/` as a PDF.

* **`Embeddings/`**: This directory contains the pre-computed embeddings for each defect definition, which were used to calculate cosine similarity against the LLM-generated detections.
    * It is organized into subdirectories, one for each of the 7 embedding models tested in our automatic classification development process.
    * Within each model's folder, a separate `.txt` file contains the vector embedding for each specific defect category.
* **`TestSuite/`**: This directory contains all the smart-contract samples used in our evaluation, separated by experiment.
    * The **`Original/`** folder holds the contracts with their original, descriptive naming conventions, which could introduce lexical bias.
    * The **`Sanitized/`** folder holds the sanitized contracts with standardized, non-descriptive names to control for lexical bias.
    * Both experiment folders are further subdivided into 10 directories, each corresponding to one of the high-level defect categories from the test suite.
* **`EvaluationResults/`**: This directory contains the detailed experimental outputs used to produce the paper's summary tables.
    * Each experiment folder includes per-category subfolders for `Metrics/`, `Results/`, `ResultCount/`, and `Reliability/`.
    * The tables are available in both `CSV` and `Markdown` formats.
    * The `All categories/` files provide the aggregate view reproduced in the appendix, while the category-specific folders expose the finer-grained results behind those summaries.
    * This is the place to inspect per-defect-category performance, confusion-matrix counts, and runtime/reliability behavior across the five experiments.

---
## Prompts Used for LLM Evaluation

### Zero-Shot Prompt

**Role:** You are a senior Smart Contract Security Auditor specializing in Solidity.

**Task:** Conduct a deep-dive security analysis of the provided contract(s).

**Code:**

    [CONTRACT_CODE]

---

### Zero-Shot + Slither Prompt

**Role:** You are a senior Smart Contract Security Auditor specializing in Solidity.

**Task:** Conduct a deep-dive security analysis of the provided contract(s).

**Code:**

    [CONTRACT_CODE]

**Slither Output:**

    [SLITHER_DETECTIONS]

Use the Slither output to ground your analysis, but do not limit your findings to these detections; perform a full manual review.

---

### CoT Prompt

**Role:** You are a senior Smart Contract Security Auditor specializing in Solidity and EVM-level exploits.

**Task:** Conduct a high-precision security analysis of the provided contract(s).

**Execution Directives:**

1. Invariant Mapping: Identify the critical security invariants of this contract (e.g., "Total deposits must always equal or exceed the sum of individual balances").
2. Adversarial State Analysis: Systematically analyze every state-changing function. Determine if a sequence of transactions—potentially involving multiple users or flash-loan-funded interactions—can violate the identified invariants or bypass access controls.
3. Logic-Heavy Search: Prioritize deep logical flaws that traditional static analysis tools often miss, such as flawed economic incentives, incorrect state updates, or integration-specific vulnerabilities (e.g., ERC-20 token standard edge cases like fee-on-transfer or rebasing tokens).

**Pruning:** Only return findings that represent a genuine, realistically exploitable risk to funds, contract availability, or administrative integrity.

**Code:**

    [CONTRACT_CODE]

---

### CoT + Slither Prompt

**Role:** You are a senior Smart Contract Security Auditor specializing in Solidity and EVM-level exploits.

**Task:** Conduct a high-precision security analysis of the provided contract(s).

**Execution Directives:**

1. Baseline Triage: I have provided the Slither static analysis output below. Use this to identify immediate "hotspots" in the code. In your internal reasoning, evaluate if these detections are true positives or if the contract's specific business logic renders them non-exploitable.
2. Independent Invariant Mapping: Disregard the Slither output for a moment and independently identify the critical security invariants of this contract (e.g., "The contract must never allow withdrawals that exceed the msg.sender's accounted balance").
3. The "Blind Spot" Search: Proactively search for high-level logical vulnerabilities that Slither is fundamentally unable to detect, such as flawed economic math, incorrect state updates across multiple transactions, or subtle integration risks with external protocols.
4. Adversarial Pressure Test: Attempt to "disprove" the Slither findings. If Slither flags a re-entrancy vulnerability, can you prove it is actually benign? Conversely, if Slither flags nothing in a critical function like withdraw(), can you find a sequence of transactions that breaks it anyway?

**Pruning:** Only return findings that represent a genuine, realistically exploitable risk to funds, contract availability, or administrative integrity.

**Code:**

    [CONTRACT_CODE]

**Slither Output:**

    [SLITHER_DETECTIONS]

---

### Structured Output Prompt

The following prompt was used to obtain structured, schema-conformant output from LLMs:

**Prompt:**

The user will provide input text. Please analyze the content and map the relevant information into the structured JSON format provided below.

**JSON Schema:**

[JSON_SCHEMA]

**Instructions:**
1. The output must strictly conform to the schema provided.
2. Return ONLY the raw JSON.
3. Do not wrap the response in markdown backticks or provide any explanations.
4. If no relevant data is found for a field, use 'null' or an empty array.

---

## API Providers

To query the models, we used the following API providers:


**Table S1: Models and their developers included in our study**

| Developers        | Models                                                                                                 |
| :--------------- | :----------------------------------------------------------------------------------------------------- |
| DeepSeek         | DeepSeek Chat, DeepSeek Reasoner, DeepSeek R1 14b                                                      |
| Mistral          | Magistral Medium, Magistral Small (local and API), Codestral, Codestral Small (local and API)          |
| xAI              | Grok 4 Fast Reasoning, Grok 4 Fast Non-Reasoning                                                       |
| OpenAI           | GPT Oss 120b, GPT Oss 20b (local and API)                                                              |
| Alibaba Cloud    | Qwen3 30b (thinking), Qwen3 30b (instruct), Qwen3 253b (thinking), Qwen3 253b (instruct)               |

---

## Automatic Classification Accuracy

The following table details the optimal combination of an embedding model and a chat model used to classify detections for each specific defect category.
Our automatic classification method was validated against a manually classified dataset. The following table details the accuracy per defect category for categories that were not classified with 100% accuracy. All defect categories not present in this table were correctly classified in our validation set.

**Table S2: Defect types that were not 100% accurately classified by our automatic classification process**

| Defect Name                                    | Accuracy compared to manual classification (%) |
| :--------------------------------------------- | :--------------------------------------------- |
| Reentrancy                                     | 98.96                                          |
| Floating Or No Pragma                          | 93.33                                          |
| Exact Balance Dependency                       | 92.31                                          |
| Block Hash Dependency                          | 90.91                                          |
| Gas Costly Pattern                             | 90.91                                          |
| Call To The Unknown                            | 89.66                                          |
| Type Cast                                      | 85.71                                          |
| Coding Error                                   | 83.33                                          |
| Unchecked Low Level Call or Send Return Values | 81.25                                          |
| DoS By Exception Inside Loop                   | 77.78                                          |
| Improper Data Validation                       | 77.78                                          |
| Bad Random Number Generation                   | 76.47                                          |
| Insufficient Gas Griefing                      | 75.00                                          |
| Mishandled Out-Of-Gas Exception                | 75.00                                          |
| Unpredictable State (Dynamic Libraries)        | 72.73                                          |
| Under-Priced Opcodes                           | 71.43                                          |
| Frozen Ether                                   | 66.67                                          |
| Token API Violation                            | 63.64                                          |
| Deprecated Source Language Features            | 60.00                                          |
| Unauthorized Ether Withdrawal                  | 55.56                                          |
| Short Address                                  | 50.00                                          |
| Unprotected Self-Destruction                   | 50.00                                          |
| Assert, Require Or Revert Violation            | 32.35                                          |
| Call Stack Depth Limit                         | 25.00                                          |
| Unexpected Throw Or Revert                     | 23.33                                          |

---

## Allowed Close Matches for Classification

To improve the accuracy of our automatic classifier, we allowed for "reasonable mistakes" by defining pairs of semantically similar defects that could be treated as equivalent. The full list of these accepted alternative matches is provided below.

**Table S3: Exact Matches and Alternatives**

| Exact Match                                  | Alternative                             |
| :------------------------------------------- | :-------------------------------------- |
| Call To The Unknown                          | Vulnerable DELEGATECALL                 |
| Gas Costly Loops                             | Gas Costly Pattern                      |
| Gas Costly Pattern                           | Gas Costly Loops                        |
| High Gas Consumption Function Type           | High Gas Consumption Variable           |
| High Gas Consumption Variable                | High Gas Consumption Function Type      |
| Violation Of Checks-Effects-Interaction Pattern | Reentrancy                              |
| Vulnerable DELEGATECALL                      | Call To The Unknown                     |
