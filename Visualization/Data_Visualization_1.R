library(ggplot2)
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()

# A scatter plot has been made for you
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# Replace ___ with the correct vector
ggplot(mtcars, aes(x = wt, y = mpg, col = disp)) +
  geom_point()

# Replace ___ with the correct vector
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +
  geom_point()


ggplot(mtcars, aes(x = wt, y = mpg, shape = disp)) +
  geom_point()
# The diamonds data frame contains information on the prices and various metrics of 50,000 diamonds. Among the 
# variables included are carat (a measurement of the size of the diamond) and price. For the next exercises, 
# we're using a subset of 1,000 diamonds.
# Here we'll use two common geom layer functions: geom_point() and geom_smooth(). We already saw in the earlier 
# exercises how these are added using a + operator.

# Explore the diamonds data frame with str()
str(diamonds)

# Use the + operator to add geom_point() to the first ggplot() command. This will tell ggplot2 to draw points on the plot.
# Add geom_point() with +
ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

# Use the + operator to add geom_point() and geom_smooth(). These just stack on each other! geom_smooth() will draw a smoothed line over the points.
# Add geom_point() and geom_smooth() with +
ggplot(diamonds, aes(x = carat, y = price)) + geom_point() + geom_smooth()

# It builds a scatter plot of the diamonds dataset, with carat on the x-axis and price on the y-axis. geom_smooth() is used to add a smooth line.

# With this plot as a starting point, let's explore some more possibilities of combining geoms.
# Show only the smooth line, but color according to clarity by using a col argument in the aes function
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) + geom_smooth()

# Hold the color settings from the previous instructions. This time plot the points, but set the alpha argument of 
# geom_point() to 0.4. This will make the points 40% transparent. Do not include geom_smooth().
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) + geom_point(aes(alpha=0.4))

# Now we explore some of the different grammatical elements. 
# Throughout this course we'll discover how they can be combined in all sorts of ways to develop unique plots.

# In the following instructions, you'll start by creating a ggplot object from the diamonds dataset. 
#Next, you'll add layers onto this object to build beautiful plots.

#Define the data and aesthetics layers: map carat on the x axis and price on the y axis. Assign it to an object: dia_plot.
# Create the object containing the data and aes layers: dia_plot
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))

# Add a geom layer with + and geom_point()
dia_plot <- ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

# Add the same geom layer, but with aes() inside
dia_plot <- ggplot(diamonds, aes(x = carat, y = price)) + geom_point(aes(col = clarity))

# Update dia_plot so that this time it contains all the functions to make a scatter plot instead of just the data 
# and aes layers. Your command should start with dia_plot <- dia_plot + .... For this instruction, use geom_point() for the geom layer. Set alpha to 0.2.
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))
dia_plot <- dia_plot + geom_point(aes(alpha = 0.2))

# Using +, plot the dia_plot object with a geom_smooth() layer on top. You don't want any error shading, which can 
# be achieved by setting the se argument in geom_smooth() to FALSE. In order to plot the figure, your command should 
# start with dia_plot + ... here.
dia_plot <- dia_plot + geom_smooth(se = FALSE)

# Modify the geom_smooth() function from the previous instruction so that it contains aes() and map clarity to the col argument.
dia_plot <- dia_plot + geom_smooth(aes(col = clarity))
dia_plot


# Example of simple plot using iris database
str(iris)
ptest <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))
ptest + geom_point()

# Basic Plotting in base package of R
#====================================

#This series of courses is primarily about understanding data visualization in the context of the grammar of graphics. To gain a better appreciation of ggplot2 and to understand how it operates differently from base package, it is useful to make some comparisions.

#In the video, you already saw one example of how to make a (poor) multivariate plot in base package. In this series of exercises we'll take a look at a better way using the equivalent version in ggplot2.

#First, let's focus on base package. We want to make a plot of mpg (miles per gallon) against wt (weight in 1,000 pounds) in the mtcars data frame, but this time we want the dots colored according to the number of cylinders. How would we do that in base package? 
#We can use a little trick to color the dots according to another variable. We can do this by specifying an integer or, even better, a factor variable as a color.

# Using the base package plot(), make a scatter plot with mtcars$wt on the x-axis and mtcars$mpg on the y-axis, colored according to mtcars$cyl (use col). Try to do it without using the data argument. The first argument should be mtcars$wt, and so on.
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

#Convert cyl to a factor variable inside the mtcars data frame.
mtcars$cyl <- as.factor(mtcars$cyl)

plot(mtcars$wt, mtcars$mpg, col = as.factor(mtcars$cyl))

# If we want to add a linear model to our plot, shown right, we can define it with lm() and then call the resulting linear model with abline(). However, if we want a model for each subgroup, according to cylinders, then we have a couple of options.
# We can subset our function, and then calculate the lm() and plot each subset separately. Alternatively, we can vectorize over the cyl variable using lapply() and combine this all in one step. This option is already prepared for you.
# Now that we have an interesting plot, there is a very important aspect missing - the legend!
# In base package you have to take care of this using the legend function. This has been done for you in the predefined code.

# Plot 1: add geom_point() in order to make a scatter plot.
# Plot 2: copy and paste Plot 1
# Add a linear model for each subset according to cyl by adding a geom_smooth() layer
# Inside this geom_smooth(), set method to "lm" and se to FALSE.
# Note: ggplot2 will automatically draw a line per cyl subset, it recognizes the groups you want to make per color in the aes() call within the ggplot() command. - Plot 3: copy and paste Plot 2 + Plot a linear model for the entire dataset, do this by adding another geom_smooth() layer + Set the group aesthetic inside this geom_smooth() layer to 1. This has to be set within the aes() function. + Set method to "lm", se to FALSE and linetype to 2. These have to be set outside aes() of the geom_smooth().

# Note: the group aesthetic will tell ggplot() to draw a single linear model through all the points.

# Basic plot
mtcars$cyl <- as.factor(mtcars$cyl)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

# Use lm() to calculate a linear model and save it as carModel
carModel <- lm(mtcars$mpg ~ mtcars$wt, data = mtcars)

# Call abline() with carModel as first argument and set lty to 2
abline(carModel, lty = 2)

# Plot each subset efficiently with lapply
# You don't have to edit this code
lapply(mtcars$cyl, function(x) {
  abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
})

# This code will draw the legend of the plot
# You don't have to edit this code
legend(x = 5, y = 33, legend = levels(mtcars$cyl),
       col = 1:3, pch = 1, bty = "n")

# Convert cyl to factor (don't need to change)
mtcars$cyl <- as.factor(mtcars$cyl)

# Example from base R (don't need to change)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
abline(lm(mpg ~ wt, data = mtcars), lty = 2)
lapply(mtcars$cyl, function(x) {
  abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
})
legend(x = 5, y = 33, legend = levels(mtcars$cyl),
       col = 1:3, pch = 1, bty = "n")

# Plot 1: add geom_point() to this command to create a scatter plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point()  # Fill in using instructions Plot 1

# Plot 2: include the lines of the linear models, per cyl
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() + # Copy from Plot 1
  geom_smooth(se = FALSE, method = "lm")   # Fill in using instructions Plot 2

# Plot 3: include a lm for the entire dataset in its whole
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() + # Copy from Plot 2
  geom_smooth(se = FALSE, method = "lm") + # Copy from Plot 2
  geom_smooth(aes(1), se = FALSE, method = "lm", linetype = 2)   # Fill in using instructions Plot 3


# So far you've seen four different forms of the iris dataset: iris, iris.wide, iris.wide2 and iris.tidy. Don't let all these different forms confuse you! It's exactly the same data, just rearranged so that your plotting functions become easier.

# To see this in action, consider the plot in the graphics device at right. Which form of the dataset would be the most appropriate to use here?

# Load the tidyr package
library(tidyr)

# Consider the structure of iris, iris.wide and iris.tidy (in that order)
str(iris)
str(iris.wide)
str(iris.tidy)



# Think about which dataset you would use to get the plot shown right
# Fill in the ___ to produce the plot given to the right
ggplot(iris.tidy, aes(x = Species, y = Value, col = Part)) +
  geom_jitter() +
  facet_grid(. ~ Measure)