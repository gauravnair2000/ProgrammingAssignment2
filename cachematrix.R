## This program describes the usage of <<- operator which can be used to
## assign a value to an object in an environment that is different from the
## current environment. Following two functions create a special object that 
## stores a square matrix and cache's its inverse

## makeCacheMatrix creates a list containing functions to
## 1. Set the value of the matrix
## 2. Get the value of the matric
## 3. Set the value of the inverse
## 4. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
	m<-NULL
	set <- function(y){
	x <<- y
	m <<- NULL
	}
	get <- function() x
	setinv <- function(inv){
	m <<- inv
	}
	getinv <- function() m
	list(set=set,get=get,
	setinv=setinv,
	getinv=getinv)	
}


## cacheSolve first checks if the inverse is already caluclated 
## and returns the inverse from the cache. Also, displays message "getting cached data"
## Otherwise it calculates the inverse via the setinv function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getinv()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
	}
	
	data <- x$get()
	m <- solve(data)
	x$setinv(m)
	m
}
