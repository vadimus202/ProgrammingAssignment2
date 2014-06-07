## Programming Assignment #2 Example

### Caching the Inverse of a Matrix
Matrix inversion is usually a costly computation and their may be some benefit to caching the inverse of a matrix rather than compute it repeatedly. This document demonstrates the use of special functions that cache the inverse of a matrix.

### Using base R Solve() function
First, we define a simple matrix

```r
my.matrix = matrix(c(1, 2, 2, 1), nrow = 2, ncol = 2)
my.matrix
```

```
##      [,1] [,2]
## [1,]    1    2
## [2,]    2    1
```

The inverse of a matrix is computed as follows:

```r
solve(my.matrix)
```

```
##         [,1]    [,2]
## [1,] -0.3333  0.6667
## [2,]  0.6667 -0.3333
```


### Using "cacheable" inverse functions

#### makeCacheMatrix() function
This function creates a special "matrix" object that can cache its inverse.

```r
source("cachematrix.R")
matrix.cached = makeCacheMatrix(my.matrix)
```

#### cacheSolve() function
This function creates a special "matrix" object that can cache its inverse.

```r
cacheSolve(matrix.cached)
```

```
##         [,1]    [,2]
## [1,] -0.3333  0.6667
## [2,]  0.6667 -0.3333
```


The second time the inverse is invoked, the cached version is used

```r
cacheSolve(matrix.cached)
```

```
## getting cached data
```

```
##         [,1]    [,2]
## [1,] -0.3333  0.6667
## [2,]  0.6667 -0.3333
```



