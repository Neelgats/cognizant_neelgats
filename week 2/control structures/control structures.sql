DECLARE
    -- Scenario 1,2: Variables
    CURSOR c_customers IS
        SELECT CustomerID, DOB, Balance
        FROM Customers;
    
    v_customerID Customers.CustomerID%TYPE;
    v_dob Customers.DOB%TYPE;
    v_age NUMBER;
    v_balance Customers.Balance%TYPE;
    
    -- Scenario 3: Variables
    CURSOR c_loans IS
        SELECT LoanID, CustomerID, EndDate
        FROM Loans
        WHERE EndDate BETWEEN SYSDATE AND SYSDATE + 30;
    
    v_loanID Loans.LoanID%TYPE;
    v_endDate Loans.EndDate%TYPE;
    
    v_customerName Customers.Name%TYPE;
    
BEGIN
    -- Scenario 1: Apply 1% Discount to Loan Interest Rates for Customers Above 60 Years Old
    FOR customer_rec IN c_customers LOOP
        v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, customer_rec.DOB) / 12);
        
        IF v_age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = customer_rec.CustomerID;
            
            DBMS_OUTPUT.PUT_LINE('Applied 1% discount for Customer ID: ' || customer_rec.CustomerID);
        END IF;
        
        -- Scenario 2: Promote Customers to VIP Status Based on Balance
        IF customer_rec.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'Y'
            WHERE CustomerID = customer_rec.CustomerID;
            
            DBMS_OUTPUT.PUT_LINE('Customer ID: ' || customer_rec.CustomerID || ' has been promoted to VIP status.');
        END IF;
    END LOOP;
    
    -- Scenario 3: Send Reminders for Loans Due in the Next 30 Days
    FOR loan_rec IN c_loans LOOP
        SELECT Name INTO v_customerName
        FROM Customers
        WHERE CustomerID = loan_rec.CustomerID;
        DBMS_OUTPUT.PUT_LINE('Reminder: Loan ID ' || loan_rec.LoanID || ' for Customer ' || v_customerName || 
                             ' (ID: ' || loan_rec.CustomerID || ') is due on ' || TO_CHAR(loan_rec.EndDate, 'YYYY-MM-DD') || '.');
    END LOOP;
    COMMIT;
END;

