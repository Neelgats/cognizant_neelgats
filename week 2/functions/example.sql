-- Calculate age of a customer born on January 1, 1980
DECLARE
    v_age NUMBER;
BEGIN
    v_age := CalculateAge(TO_DATE('1980-01-01', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Customer Age: ' || v_age);
END;


-- Calculate monthly installment for a loan of $10,000 with an annual interest rate of 5% over 10 years


-- DECLARE
--     v_installment NUMBER;
-- BEGIN
--     v_installment := CalculateMonthlyInstallment(10000, 5, 10);
--     DBMS_OUTPUT.PUT_LINE('Monthly Installment: $' || v_installment);
-- END;


-- Check if account ID 1 has at least $500


-- DECLARE
--     v_has_sufficient_balance BOOLEAN;
-- BEGIN
--     v_has_sufficient_balance := HasSufficientBalance(1, 500);
--     IF v_has_sufficient_balance THEN
--         DBMS_OUTPUT.PUT_LINE('Account has sufficient balance.');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Insufficient balance.');
--     END IF;
-- END;

