DECLARE
    CURSOR cur_accounts IS
        SELECT AccountID, Balance
        FROM Accounts;
    
    v_account_id Accounts.AccountID%TYPE;
    v_balance Accounts.Balance%TYPE;
    v_fee NUMBER := 50;  -- Example annual fee amount

BEGIN
    OPEN cur_accounts;
    
    LOOP
        FETCH cur_accounts INTO v_account_id, v_balance;
        EXIT WHEN cur_accounts%NOTFOUND;
        
        -- Deduct the annual fee from the account balance
        UPDATE Accounts
        SET Balance = v_balance - v_fee
        WHERE AccountID = v_account_id;
    END LOOP;
    
    CLOSE cur_accounts;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Annual fee applied to all accounts.');
END;
