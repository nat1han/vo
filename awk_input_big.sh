awk 'BEGIN {
    xmin = -8955;
    xmax = 8834;
    steps = 340;
    step = (xmax - xmin)/steps;
    for (i = 0; i < steps; i++) {
        printf("%.6f %.6f\n", xmin + i*step, xmin + (i+1)*step);
    }
}' > input_big.txt
