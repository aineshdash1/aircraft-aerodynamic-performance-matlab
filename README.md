# Aircraft Aerodynamic Performance Analysis Using MATLAB

## Overview

This project uses MATLAB to analyze the aerodynamic performance of a simplified aircraft model over a range of flight velocities.

The analysis starts with basic lift and drag calculations and progressively develops a steady-level-flight model using a parabolic drag polar. The project investigates the relationship between velocity, lift, drag, lift coefficient, drag coefficient, and aerodynamic efficiency.

The model also examines the effects of aircraft mass on level-flight speed and stall speed.

---

## Objectives

The main objectives of this project are to:

* Calculate aircraft lift and drag over a range of velocities.
* Analyze the lift-to-drag ratio ($L/D$).
* Calculate the required lift coefficient for steady-level flight.
* Calculate drag coefficient using a parabolic drag polar.
* Generate and analyze a drag polar.
* Determine the maximum lift-to-drag ratio and corresponding optimum lift coefficient.
* Calculate level-flight speeds for different aircraft masses.
* Calculate stall speeds for different aircraft masses.
* Visualize aerodynamic performance using MATLAB plots.

---

## Theoretical Background

### 1. Lift

Aircraft lift is calculated using:

$$
L = \frac{1}{2}\rho V^2 S C_L
$$

where:

* $L$ = Lift force (N)
* $\rho$ = Air density (kg/m³)
* $V$ = Flight velocity (m/s)
* $S$ = Wing reference area (m²)
* $C_L$ = Lift coefficient

---

### 2. Drag

Drag is calculated using:

$$
D = \frac{1}{2}\rho V^2 S C_D
$$

where:

* $D$ = Drag force (N)
* $C_D$ = Drag coefficient

---

### 3. Lift-to-Drag Ratio

Aerodynamic efficiency is represented by:

$$
\frac{L}{D}
$$

A higher $L/D$ indicates greater aerodynamic efficiency.

---

### 4. Steady-Level Flight

For steady, level flight:

$$
L = W
$$

where aircraft weight is:

$$
W = mg
$$

Therefore, the required lift coefficient at a given velocity is:

$$
C_L = \frac{2W}{\rho V^2S}
$$

This shows that the required $C_L$ decreases as velocity increases.

---

### 5. Drag Polar

The drag coefficient is modeled using a parabolic drag polar:

$$
C_D = C_{D0} + kC_L^2
$$

where:

* $C_{D0}$ = Zero-lift drag coefficient
* $k$ = Induced drag factor
* $C_L$ = Lift coefficient

This model represents the combination of parasite drag and induced drag.

---

### 6. Maximum Lift-to-Drag Ratio

For the parabolic drag polar, the optimum lift coefficient is:

$$
C_{L,opt} = \sqrt{\frac{C_{D0}}{k}}
$$

The corresponding maximum lift-to-drag ratio is:

### Maximum Lift-to-Drag Ratio

The maximum lift-to-drag ratio is given by:

**(L/D)max = 1 / (2√(CD0 × k))**

---

### 7. Stall Speed

Stall speed is estimated using:

$$
V_s =
\sqrt{\frac{2W}{\rho S C_{L,max}}}
$$

where $C_{L,max}$ is the maximum lift coefficient.

---

## Aircraft Parameters

The following parameters are used in the MATLAB model:

| Parameter                             |       Value |
| ------------------------------------- | ----------: |
| Air density, $\rho$                   | 1.225 kg/m³ |
| Wing area, $S$                        |     16.2 m² |
| Aircraft mass                         |     1000 kg |
| Gravitational acceleration, $g$       |   9.81 m/s² |
| Zero-lift drag coefficient, $C_{D0}$  |        0.02 |
| Induced drag factor, $k$              |        0.05 |
| Fixed lift coefficient, $C_L$         |         0.5 |
| Fixed drag coefficient, $C_D$         |        0.03 |
| Maximum lift coefficient, $C_{L,max}$ |         1.5 |
| Velocity range                        |  10–100 m/s |

The analysis also compares aircraft masses of **800 kg, 1000 kg, and 1200 kg**.

---

## MATLAB Analysis

The MATLAB script performs the following analyses:

### 1. Lift and Drag vs Velocity

The first part calculates lift and drag using fixed values of $C_L$ and $C_D$.

Since:

$$
L,D \propto V^2
$$

both lift and drag increase quadratically with velocity under these assumptions.

---

### 2. Lift-to-Drag Ratio

The script calculates:

```matlab
LD = L./D;
```

For constant $C_L$ and $C_D$:

$$
\frac{L}{D} = \frac{C_L}{C_D}
$$

Therefore, the resulting $L/D$ remains constant.

---

### 3. Steady-Level-Flight Lift Coefficient

For a 1000 kg aircraft, the required $C_L$ is calculated at each velocity using:

```matlab
CL_level = (2*W)./(rho.*V.^2*S);
```

The resulting plot demonstrates that the required lift coefficient decreases as velocity increases.

---

### 4. Drag Coefficient

The drag coefficient is calculated using:

```matlab
CD_level = CD0 + k.*CL_level.^2;
```

This demonstrates the relationship between lift and drag coefficients through the parabolic drag polar.

---

### 5. Drag and Aerodynamic Efficiency

The steady-level-flight drag is calculated using:

```matlab
D_level = 0.5*rho.*V.^2*S.*CD_level;
```

and the corresponding lift-to-drag ratio using:

```matlab
LD_level = L_level./D_level;
```

This produces the characteristic variation of drag and aerodynamic efficiency with velocity.

---

### 6. Drag Polar

The drag polar is generated using:

```matlab
CL_range = 0:0.01:1.5;
CD_range = CD0 + k.*CL_range.^2;
```

The resulting curve shows the increase in drag coefficient with lift coefficient.

---

### 7. Maximum $L/D$

The script calculates:

```matlab
CL_opt = sqrt(CD0/k);
LD_max = 1/(2*sqrt(CD0*k));
```

For the selected parameters:

* Optimum $C_L$ ≈ **0.63**
* Maximum $L/D$ ≈ **15.81**

---

### 8. Effect of Aircraft Mass

The model calculates the velocity required for level flight at a fixed $C_L$ for aircraft masses of:

* 800 kg
* 1000 kg
* 1200 kg

The relationship used is:

$$
V = \sqrt{\frac{2W}{\rho S C_L}}
$$

This demonstrates that a heavier aircraft requires a higher flight velocity to generate the required lift at the same $C_L$.

---

### 9. Stall Speed

Stall speed is calculated for the same three aircraft masses using:

$$
V_s =
\sqrt{\frac{2W}{\rho S C_{L,max}}}
$$

The analysis demonstrates that stall speed increases with aircraft mass.

---

## Results

For the selected aircraft parameters, the model gives:

### Maximum Aerodynamic Efficiency

$$
C_{L,opt} \approx 0.63
$$

$$
(L/D)_{max} \approx 15.81
$$

### Level-Flight Speed at $C_L = 0.5$

|    Mass | Level-flight speed |
| ------: | -----------------: |
|  800 kg |        ≈ 22.95 m/s |
| 1000 kg |        ≈ 25.67 m/s |
| 1200 kg |        ≈ 28.15 m/s |

### Stall Speed

Using $C_{L,max}=1.5$:

|    Mass | Stall speed |
| ------: | ----------: |
|  800 kg | ≈ 22.95 m/s |
| 1000 kg | ≈ 25.67 m/s |
| 1200 kg | ≈ 28.15 m/s |

> **Note:** The numerical values above are based on the equations and parameters used in the MATLAB model. The project is intended as a simplified aerodynamic analysis rather than a complete aircraft performance prediction.

---

## Assumptions

The model uses several simplifying assumptions:

* Standard sea-level air density is assumed to be constant.

* The aircraft is modeled using a fixed wing reference area.

* The aircraft is assumed to be in steady, level flight for the performance analysis.

* The drag polar is represented by the simplified parabolic relation:

  \(C_D=C_{D0}+kC_L^2\)

* Compressibility effects are neglected.

* Reynolds-number effects are neglected.

* Ground effect is neglected.

* Propulsion and engine performance are not modeled.

* Aircraft configuration changes are not considered.

* The aerodynamic coefficients are based on simplified representative values rather than experimental aircraft data.

---

## Project Structure

```text
aircraft-aerodynamic-performance-matlab/
│
├── aircraft_performance_analysis.m
├── README.md
└── results/
    ├── lift_drag.png
    ├── lift_to_drag.png
    ├── lift_coefficient.png
    ├── drag_coefficient.png
    ├── drag_vs_velocity.png
    ├── aerodynamic_efficiency.png
    ├── drag_polar.png
    ├── ld_vs_cl.png
    └── stall_speed_vs_mass.png
```

---

## Tools Used

* **MATLAB**
* MATLAB plotting and numerical computation functions
* Basic aircraft aerodynamic equations

---

## Future Improvements

Possible extensions to the project include:

* Modeling parasite and induced drag separately.
* Adding thrust and power required calculations.
* Determining minimum and maximum level-flight speeds.
* Adding rate-of-climb analysis.
* Investigating the effect of altitude on aircraft performance.
* Including atmospheric density variation with altitude.
* Comparing different aircraft configurations.
* Adding a graphical user interface (GUI).
* Extending the model to include Mach number and compressibility effects.
* Comparing the analytical model with published aircraft performance data.

---

## Author

**Ainesh**
B.Tech Aerospace Engineering
Indian Institute of Technology Madras

---

## License

This project is intended for educational and academic purposes.
