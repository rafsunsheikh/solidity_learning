
  # Smart Contract Audit Report
  
  ## Auditor Details
  
  - **Auditor Name:** Rafsun Sheikh
  - **Client Name:** AUDD
  - **Date:** 7-October-2024
  - **Auditor Logo:** Not provided
  - **Auditor Twitter:** Not provided
  - **Auditor Github:** rafsunsheikh
  - **Auditor Telegram:** Not provided
  - **Auditor Linkedin:** Not provided
  
  
  
  ## Audit Details
  
  - **Description:** A static audit of the AUDD Ethereum ERC-20 token is done using AuditWizard (app.auditwizard.io). 
The tool uses  '4naly3er' and 'aderyn' to scan for vulnerability.
No severe vulnerabilities are found on the StableCoin.sol file while auditing, except for some 'Low-risk' ones.
  - **Audit Type:** undefined
  - **Audit Timeline:** undefined
  - **EVM:** undefined
  - **Languages:** undefined
  - **Documentation Quality:** undefined
  - **Test Quality:** undefined
  - **Commit Hash:** undefined
  
  
  
  ## Findings
  
  
  ### Centralization Risk for trusted owners
  
  - **Description:** Contracts have owners with privileged rights to perform admin tasks and need to be trusted not to perform malicious updates or drain funds.
  - **Recommendation:** No recommendations were provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 829
  - **Status:** undefined
  

  ### Missing checks for 'address(0)' when assigning values to address state variables
  
  - **Description:** Check for address(0) when assigning values to address state variables.

  - **Recommendation:** No recommendations provided.

  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 848
  - **Status:** undefined
  

  ### 'public' functions not used internally could be marked 'external'
  
  - **Description:** Instead of marking a function as public, consider marking it as external if it is not used internally.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1235
  - **Status:** undefined
  

  ### Centralization Risk for trusted owners
  
  - **Description:** Contracts have owners with privileged rights to perform admin tasks and need to be trusted to not perform malicious updates or drain funds.

  - **Recommendation:** No recommendations provided.

  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 837
  - **Status:** undefined
  

  ### Missing checks for 'address(0)' when assigning values to address state variables
  
  - **Description:** Check for address(0) when assigning values to address state variables.

  - **Recommendation:** No recommendations provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1387
  - **Status:** undefined
  

  ### Missing checks for 'address(0)' when assigning values to address state variables
  
  - **Description:** Check for address(0) when assigning values to address state variables.

  - **Recommendation:** No recommendations provided.

  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1338
  - **Status:** undefined
  

  ### Missing checks for 'address(0)' when assigning values to address state variables
  
  - **Description:** Check for address(0) when assigning values to address state variables.

  - **Recommendation:** No recommendations provided.

  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1340
  - **Status:** undefined
  

  ### Missing checks for 'address(0)' when assigning values to address state variables
  
  - **Description:** Check for address(0) when assigning values to address state variables.

  - **Recommendation:** No recommendations provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1362
  - **Status:** undefined
  

  ### Missing checks for 'address(0)' when assigning values to address state variables
  
  - **Description:** Check for address(0) when assigning values to address state variables.

  - **Recommendation:** No recommendations provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1417
  - **Status:** undefined
  

  ### Missing checks for 'address(0)' when assigning values to address state variables
  
  - **Description:** Check for address(0) when assigning values to address state variables.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1601
  - **Status:** undefined
  

  ### 'public' functions not used internally could be marked 'external'
  
  - **Description:** Instead of marking a function as public, consider marking it as external if it is not used internally.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1161
  - **Status:** undefined
  

  ### 'public' functions not used internally could be marked 'external'
  
  - **Description:** Instead of marking a function as public, consider marking it as external if it is not used internally.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1169
  - **Status:** undefined
  

  ### 'public' functions not used internally could be marked 'external'
  
  - **Description:** Instead of marking a function as public, consider marking it as external if it is not used internally.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1212
  - **Status:** undefined
  

  ### 'public' functions not used internally could be marked 'external'
  
  - **Description:** Instead of marking a function as public, consider marking it as external if it is not used internally.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1186
  - **Status:** undefined
  

  ### 'public' functions not used internally could be marked 'external'
  
  - **Description:** Instead of marking a function as public, consider marking it as external if it is not used internally.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1200
  - **Status:** undefined
  

  ### The 'nonReentrant' 'modifier' should occur before all other modifiers
  
  - **Description:** This is a best-practice to protect against reentrancy in other modifiers.

  - **Recommendation:** Follow the best practices.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1874
  - **Status:** undefined
  

  ### 'public' functions not used internally could be marked 'external'
  
  - **Description:** Instead of marking a function as public, consider marking it as external if it is not used internally.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1193
  - **Status:** undefined
  

  ### 'public' functions not used internally could be marked 'external'
  
  - **Description:** Instead of marking a function as public, consider marking it as external if it is not used internally.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1257
  - **Status:** undefined
  

  ### 'public' functions not used internally could be marked 'external'
  
  - **Description:** Instead of marking a function as public, consider marking it as external if it is not used internally.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1280
  - **Status:** undefined
  

  ### 'public' functions not used internally could be marked 'external'
  
  - **Description:** Instead of marking a function as public, consider marking it as external if it is not used internally.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1300
  - **Status:** undefined
  

  ### 'public' functions not used internally could be marked 'external'
  
  - **Description:** Instead of marking a function as public, consider marking it as external if it is not used internally.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1586
  - **Status:** undefined
  

  ### 'public' functions not used internally could be marked 'external'
  
  - **Description:** Instead of marking a function as public, consider marking it as external if it is not used internally.

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1625
  - **Status:** undefined
  

  ### The 'nonReentrant' 'modifier' should occur before all other modifiers
  
  - **Description:** This is a best-practice to protect against reentrancy in other modifiers.

  - **Recommendation:** Follow the best practices.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 2062
  - **Status:** undefined
  

  ### Loop contains 'require' / 'revert' statements
  
  - **Description:** Avoid require/revert statements in a loop because a single bad item can cause the whole transaction to fail. It's better to forgive on fail and return failed elements post-processing of the loop

  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1825
  - **Status:** undefined
  

  ### Loop contains 'require' / 'revert' statements
  
  - **Description:** Avoid require/revert statements in a loop because a single bad item can cause the whole transaction to fail. It's better to forgive on fail and return failed elements post-processing of the loop
  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 1855
  - **Status:** undefined
  

  ### Loop contains 'require' / 'revert' statements
  
  - **Description:** Avoid require/revert statements in a loop because a single bad item can cause the whole transaction to fail. It's better to forgive on fail and return failed elements post-processing of the loop
  - **Recommendation:** No recommendation provided.
  - **Severity:** 2
  - **Location in Code:** File Path: ResolvedProxy (1)/StableCoin/StableCoin/contracts/StableCoin.sol
Line: 2007
  - **Status:** undefined
  
  
  