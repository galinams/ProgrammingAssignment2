## This pair of functions cache the inverse of a matrix

## The first function 'makeCacheMatrix' creates a special matrix, which is realy a list to:
##set the value of the matrix
##get the value of the matrix
##set the value of the solve
##get the vale of the solve

makeCacheMatrix <- function(x = matrix()) {
  s<- NULL
  set<- function(y){
    x<<-y
    s<<-NULL
  }
get<- function()x
setsolve<- function(solve) s<<-solve
getsolvse<-function()s
list(set=set, get=get, setsolve=setsolve,getsolve=getsolve)

}

## The second function creates the inverse of the special matrix created in the above 
## makeCacheMatrix function. However, it first checks if the inverse has already been calculated.
## If so, it gets the inverse from the cache and skips the computation.Otherwise, it calculates 
## the inverse of the data and sets the value of the inverse matrix via the setsolve function.
##

cacheSolve <- function(x, ...) {
    s <- x$getsolve()
    if(!is.null(s)) {                  ##if the inverse was cached
      message("getting cached data")
      return(s)                        ##exits without executing subsequent code
    }
    data <- x$get()                    ##otherwise put the data in 'data'
    s <- solve(data, ...)              ##compute the inverse of the data
    x$setsolve(s)                      ##call function to cache the inverse matrix
    s                                  ##return the inverse matrix
}
