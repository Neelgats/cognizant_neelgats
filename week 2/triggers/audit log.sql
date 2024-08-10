CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    -- Insert a record into the AuditLog table
    INSERT INTO AuditLog (LogID, TransactionID, ActionTime, ActionType, Details)
    VALUES (AuditLog_SEQ.NEXTVAL, :NEW.TransactionID, SYSDATE, 'INSERT', 'Transaction added for AccountID: ' || :NEW.AccountID);
END;
