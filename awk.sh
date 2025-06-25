awk 'BEGIN {
    xmin = -8955;
    xmax = 8834;
    steps = 34;
    step_size = (xmax - xmin) / steps;
    for (i = 0; i < steps; i++) {
        start = xmin + i * step_size;
        end = start + step_size;
        printf("%.6f %.6f\n", start, end);
    }
}' > input.txt
