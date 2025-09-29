use context dcic2024
length-circ = 15
length-rect1 = 100
length-rect2 = 60
colorA = "darkgreen"
colorB = "red"
shape = "solid"
flag-rect = rectangle(length-rect1, length-rect2, shape, colorA)
flag-circ = circle(length-circ, shape, colorB)
flag = overlay(flag-circ, flag-rect)
flag











sl4 = 35
color3 = "orange"
orange-triangle = triangle(sl4, shape, color3)
sl = 100
sl2 = 70
sl3 = 25
color = "black"
color2 = "yellow"
sq = square(sl, shape, color)
rect = rectangle(sl, sl2, shape, color)
circ = circle(sl3, shape, color2)
rectcircl = above(circ, rect)

sidetris = beside(

