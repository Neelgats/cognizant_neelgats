DECLARE
    CURSOR cur_transactions IS
        SELECT t.TransactionID, t.AccountID, t.TransactionDate, t.Amount, t.TransactionType, a.CustomerID
        FROM Transactions t
        JOIN Accounts a ON t.AccountID = a.AccountID
        WHERE EXTRACT(MONTH FROM t.TransactionDate) = EXTRACT(MONTH FROM SYSDATE)
          AND EXTRACT(YEAR FROM t.TransactionDate) = EXTRACT(YEAR FROM SYSDATE);
    
    v_customer_id Accounts.CustomerID%TYPE;
    v_transaction_id Transactions.TransactionID%TYPE;
    v_account_id Transactions.AccountID%TYPE;
    v_transaction_date Transactions.TransactionDate%TYPE;
    v_amount Transactions.Amount%TYPE;
    v_transaction_type Transactions.TransactionType%TYPE;

BEGIN
    OPEN cur_transactions;
    
    LOOP
        FETCH cur_transactions INTO v_transaction_id, v_account_id, v_transaction_date, v_amount, v_transaction_type, v_customer_id;
        EXIT WHEN cur_transactions%NOTFOUND;
        
        -- Print or process the transaction details for the customer
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id ||
                             ', Transaction ID: ' || v_transaction_id ||
                             ', Account ID: ' || v_account_id ||
                             ', Date: ' || v_transaction_date ||
                             ', Amount: ' || v_amount ||
                             ', Type: ' || v_transaction_type);
    END LOOP;
    
    CLOSE cur_transactions;
END;
