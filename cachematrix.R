---
title: "MakeMatrix Function"
author: "OscarAMtz"
date: "31 de enero de 2019"
output: html_document
---
#Function Make Matrix inverted
##Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than computing it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). Your assignment is to write a pair of functions that cache the inverse of a matrix.

Write the following functions:

makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.
Computing the inverse of a square matrix can be done with the solve function in R. For example, if X is a square invertible matrix, then solve(X) returns its inverse.

For this assignment, assume that the matrix supplied is always invertible.

In order to complete this assignment, you must do the following:

Fork the GitHub repository containing the stub R files at https://github.com/rdpeng/ProgrammingAssignment2 to create a copy under your own account.
Clone your forked GitHub repository to your computer so that you can edit the files locally on your own machine.
Edit the R file contained in the git repository and place your solution in that file (please do not rename the file).
Commit your completed R file into YOUR git repository and push your git branch to the GitHub repository under your account.
Submit to Coursera the URL to your GitHub repository that contains the completed R code for the assignment.




```{r setup, include=FALSE}
## Initiate a set of functions that manage the matrix provided
makeMatrix <- function(x = matrix()) {
        
### Setting up the dummy object to store the inverted matrix 
        inv_m <- NULL
        
### Programming the "set" subfunction to store in cache the objects
        set <- function(y) {
                x <<- y
                inv_m <<- NULL
        }
        
### Programming the "get" for recovering the main matrix stored
        get <- function() x
        setInvertedM <- function(inverted) inv_m <<- inverted
        getInvertedM <- function() inv_m
### Adding a test for the inverted matrix
        testInvertedM <- function() inv_m %*% x
### Programming a list for managing the variables and the test function
        list(set = set, get = get,
             setInvertedM = setInvertedM,
             getInvertedM = getInvertedM,
             testInvertedM = testInvertedM)
}

###Setting up the "cachematrix" function, that generates the inverted matrix
cachematrix <- function(x, ...) {
        inv_m <- x$getInvertedM()
        if(!is.null(inv_m)) {
                message("getting cached inverted matrix")
                return(inv_m)
        }
        data <- x$get()
        inv_m <- solve(data)
         x$setInvertedM(inv_m)
        inv_m
        
}
