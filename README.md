# poly_lisp

this program performs the following operations with polynomials
* addition of two polynomials
* addition of a term and a polynomial
* multiplication of two polynomials
* multiplication of a term and a polynomial
* two term multiplication
* polynomial exponentiation
* subtraction of two polynomials
* polynomial sorting

The polynomial is entered as follows
     
     ((5 (X 2)) (4 (Y 1)) (-1) (2 (Y 2)))
    
Where 5, 4, -1 and 2 is ratios,(x 2) - x squared.

***For example***

*input*

    (setq p1 '((3(x 2)) (4(y 1)) (-1) (2(x 2)) (2(y 2))))
    (setq p2 '((1)))
    
input is done in the program

*output*

     ((5 (X 2)) (4 (Y 1)) (-1) (2 (Y 2)))
