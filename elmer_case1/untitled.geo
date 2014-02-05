Point(1) = {-5, -5, 0, 1.0};
Point(2) = {5, -5, 0, 1.0};
Point(3) = {5, 5, 0, 1.0};
Point(4) = {-5, 5, 0, 1.0};
Line(1) = {4, 3};
Line(2) = {3, 2};
Line(3) = {2, 1};
Line(4) = {1, 4};
Line Loop(5) = {1, 2, 3, 4};
Plane Surface(6) = {5};
Extrude {0, 0, 10} {
  Surface{6};
}
Extrude {0, 0, 10} {
  Surface{28};
}
