class EquipmentsPageContent {
  final List<String> titles = [
    'Li-ion cell testing lab 5V12A 8Ch',
    'IMPEDANCE ANALYZER (1 mHz to 200kHz)',
    '100 Cells for testing',
    'Fixture for cell testing',
    'Li-ion pack testing 99V 10A Charging 20 A discharging 1Ch',
    'Pack ACIR testing lab 60V 1Ch',
    'Li-ion battery packs for testing',
    'Jigs, wiring & fixture for testing',
    'Environmental chamber (-10 to +70 Deg Cel)',
    '5 units of single cell BMS algorithm Development Lab',
    '5 units of single cell multi cell BMS algorithm Development',
    'BMS algorithm Software Package',
  ];

  final List<String> semidescription = [
    //tile01
    'The Li-ion cell testing lab setup is designed to efficiently '
        'evaluate the performance and safety of lithium-ion batteries. '
        'This system features an 8-channel configuration, allowing simultaneous '
        'testing of multiple cells. With a high precision of 5V and 12A, it '
        'ensures accurate measurements of voltage, current, and capacity. '
        'Each channel is equipped with independent control and monitoring, '
        'enabling comprehensive testing of different cell types and conditions. '
        'The lab setup includes automated charge and discharge cycles, providing '
        'detailed insights into battery life and efficiency. It is ideal for assessing '
        'battery health, durability, and compliance with industry standards. The system '
        'also supports data logging and analysis for in-depth performance evaluations. '
        'This setup is essential for research, development, and quality control in battery manufacturing.',

    //tile02
    'The impedance analyzer is a sophisticated instrument designed for measuring impedance '
        'across a broad frequency range from 1 mHz to 200 kHz. It is essential for characterizing '
        'the electrical properties of components and materials, providing accurate data on resistance, '
        'capacitance, and inductance. The analyzer features high-resolution measurements and precise '
        'frequency control, allowing for detailed analysis of impedance characteristics over a wide spectrum. '
        'Its versatility makes it suitable for various applications, including material science, electronics, '
        'and electrochemical research. The device supports both single and multi-frequency measurements, '
        'enabling comprehensive impedance profiling. Equipped with advanced software, it offers real-time '
        'data visualization and analysis. The analyzer'
        'high sensitivity and accuracy make it an invaluable tool for evaluating the performance and '
        'reliability of electronic components and systems.',

    //tile03
    'This setup is ideal for performing batch testing, assessing the performance, and ensuring the quality of cells used '
        'in various applications, such as batteries or electronic components. The system allows for efficient testing and '
        'data collection, optimizing the evaluation process and ensuring consistent quality control.',

    //tile04
    'A "Fixture for Cell Testing" is a specialized apparatus designed to hold and connect multiple cells securely '
        'during testing. It ensures precise alignment and stable contact between the cells and testing equipment, '
        'enabling accurate measurement of electrical properties such as voltage, current, and impedance. This fixture '
        'is crucial for maintaining consistency and reliability in performance evaluations and quality control processes.',

    //tile05
    'The "Li-ion Pack Testing 99V 10A Charging 20A Discharging 1Ch" system is designed for evaluating lithium-ion battery '
        'packs. It supports a maximum voltage of 99V and can handle charging currents up to 10A and discharging currents up '
        'to 20A. This single-channel testing unit allows for thorough assessment of battery pack performance, '
        'including capacity, efficiency, and safety under various operational conditions.',

    //tile06
    'The "Pack ACIR Testing Lab 60V 1Ch" is a specialized setup for measuring the AC internal resistance of battery packs.'
        ' It supports a maximum voltage of 60V and features a single-channel configuration, allowing for precise evaluation '
        'of battery pack performance under alternating current conditions. This lab equipment is crucial for assessing '
        'the internal resistance and overall health of battery packs, ensuring reliable and efficient energy storage systems.',

    //tile07
    'Li-ion battery packs for testing are pre-configured battery units designed for evaluation and analysis. '
        'They provide a controlled environment to assess various performance metrics such as capacity, voltage stability, '
        'and discharge characteristics. These packs are essential for validating the functionality and safety of '
        'battery management systems and testing equipment.',

    //tile08
    'Jigs, wiring, and fixtures for testing are essential tools used to securely hold and connect components '
        'during electrical and electronic evaluations. Jigs ensure accurate positioning and alignment of parts, '
        'while wiring provides the necessary electrical connections. Fixtures support and stabilize components, '
        'facilitating reliable and repeatable testing processes.',

    //tile09
    'An environmental chamber with a temperature range of -10 to +70°C is used to simulate and test the performance '
        'of products under various temperature conditions. It provides controlled environmental conditions to assess '
        'the reliability, durability, and functionality of components and devices across a wide temperature spectrum.',

    //tile10
    'A lab equipped with 5 units of single-cell Battery Management System (BMS) for algorithm development allows '
        'for the testing and optimization of BMS algorithms. These units facilitate the study of cell behavior, '
        'safety features, and performance under various conditions, supporting advancements in battery management technology.',

    //tile11
    'A lab with 5 units for single-cell and multi-cell BMS (Battery Management System) algorithm development '
        'supports comprehensive testing and refinement of BMS algorithms across both single and multiple cell configurations. '
        'This setup enables the analysis of complex battery management scenarios, including cell balancing, fault detection, '
        'and performance optimization for enhanced battery safety and efficiency.',

    //tile12
    'The BMS (Battery Management System) algorithm software package provides a comprehensive suite of tools and algorithms '
        'for managing and optimizing battery performance. It includes features for cell monitoring, state-of-charge (SOC) '
        'estimation, fault detection, and cell balancing. This software is essential for ensuring the safety, longevity, '
        'and efficiency of battery systems in various applications.',
  ];

  final List<String> description = [
    // Tile 01
    'Input Power: 826 W\n'
        'Input Voltage: AC 220V/110V ±10%, 50Hz\n\n'
        'Voltage Output Range: 25 mV – 5 V (Constant Voltage Mode)\n'
        'Current Output Range (per channel):\n'
        'Range 1: 5 mA – 1 A\n'
        'Range 2: 1 A – 6 A\n'
        'Range 3: 6 A – 12 A\n\n'
        'CV Cut-off Current:\n'
        'Range 1: 2 mA\n'
        'Range 2: 12 mA\n'
        'Range 3: 24 mA\n\n'
        'Output Power per Channel: 60 W\n'
        'Minimum Data Recording Interval: 100 ms\n'
        'Voltage Resolution: 10 mV\n'
        'Current Resolution:\n'
        'Range 1: 2 mA\n'
        'Range 2: 12 mA\n'
        'Range 3: 24 mA\n\n'
        'Data Recording Frequency: 10 Hz\n'
        'Voltage and Current Measurement: 4-wire connection\n'
        'Maximum Cycles: 65,535',

    // Tile 02
    'Measurement Modes:\n'
        'LCR Mode\n'
        'Continuous Measurement Mode (LCR Mode / Analyzer Mode)\n'
        'Analyzer Mode: Includes frequency sweeps, measurement level adjustments, temperature characteristics, and equivalent circuit analysis\n\n'
        'Measurement Parameters:\n'
        'Impedance (Z), Admittance (Y), Phase Angle (θ)\n'
        'Series/Parallel Resistance (Rs, Rp), DC Resistance (Rdc)\n'
        'Reactance (X), Conductance (G), Susceptance (B)\n'
        'Capacitance: Cs (series), Cp (parallel)\n'
        'Inductance: Ls (series), Lp (parallel)\n'
        'Dissipation Factor (tan δ), Quality Factor (Q)\n'
        'Temperature (T), Conductivity (σ), Dielectric Constant (ε)\n\n'
        'Measurement Ranges:\n'
        'Resistance (Z): 100 mΩ to 100 MΩ (10 auto ranges)\n'
        'Angle (θ): ±0.000° to 180.000°\n'
        'Dissipation Factor (D): ±0.00000 to 9.99999\n'
        'Quality Factor (Q): ±0.00 to 99,999.9\n'
        'Temperature (T): -10.0°C to 99.9°C\n'
        'Conductivity (σ), Dielectric Constant (ε): ±0.00000f to 999.999G\n\n'
        'Display:\n'
        '5.7-inch Color TFT: ON/OFF switchable\n'
        'Display Range: Z, Y, Rs, Rp, Rdc, X, G, B, Ls, Lp, Cs, Cp, σ, ε, θ, D, Q\n\n'
        'Accuracy:\n'
        'Impedance (Z): ±0.05%\n'
        'Phase Angle (θ): ±0.03°\n\n'
        'Measurement Frequency:\n'
        'Range: 1 mHz to 200 kHz (5-digit resolution, minimum step 1 mHz)\n\n'
        'Measurement Signal Level:\n'
        'Voltage Mode (V/CV): 5 mV to 5 Vrms (1 mVrms steps)\n'
        'Current Mode (CC): 10 µA to 50 mArms (10 µArms steps)\n'
        'Low Impedance High Accuracy Mode: V mode (up to 2.5 Vrms) and CC mode (up to 100 mArms)\n\n'
        'Performance:\n'
        'Measurement Time: 2 ms (1 kHz, FAST mode, display OFF)\n\n'
        'Interfaces:\n'
        'Standard: USB (high-speed), USB Memory, EXT I/O (Handler)\n'
        'Optional: RS-232C, GP-IB, or LAN\n'
        'Power Supply:\n'
        'Voltage: 100 to 240 V AC, 50/60 Hz, 50 VA max\n'
        'Dimensions & Weight:\n'
        'Size: 330 mm (W) × 119 mm (H) × 168 mm (D)\n'
        'Weight: 3.1 kg (109.3 oz)',

    // Tile 03
    'NMC (Nickel Manganese Cobalt) Batteries:\n'
        'a. 18650 (Cylindrical)\n'
        'b. 21700 (Cylindrical)\n'
        'c. 26650 (Cylindrical)\n'
        'd. 96 AH (Prismatic)\n'
        'e. Pouch Type\n\n'
        'LFP (Lithium Iron Phosphate) Batteries:\n'
        'a. Cylindrical (Various sizes)\n'
        'b. Prismatic',

    // Tile 04
    'Cell Testing Jigs:\n'
        '10 mA Jig for Coin Cells\n'
        '30 Amp Jig for Cylindrical & Prismatic Cells\n'
        '100 Amp Jig for Prismatic Cells\n'
        'Jig for Pouch Cells\n'
        'Special Cylindrical Jig for ACIR Testing\n'
        'Thermal Testing Extension for Cell Testing',

    // Tile 05
    'Power Supply:\n'
        'Input Voltage: AC 220V ±10%, 50/60Hz\n\n'
        'Basic Functions:\n'
        'Charge & Discharge\n'
        'Auto-Cycle Function\n'
        'Test Data Analysis\n'
        'Test Data Import/Export\n\n'
        'Applicable Batteries:\n'
        'Lead-Acid Battery Pack\n'
        'Li-ion Battery Pack\n'
        'Battery Rated Voltage:\n'
        '12V - 84V\n\n'
        'Charging Specifications:\n'
        'Charging Methods: Constant Voltage (CV) & Constant Current (CC)\n'
        'Charge Current: 0.5 - 10A (adjustable, 0.1A steps)\n'
        'Charge Cut-Off Current: 0.1 - 5A (adjustable, 0.1A steps)\n'
        'Charge Voltage Range: 9V - 99V (adjustable, 0.1V steps)\n'
        'Charge Current Accuracy: ±0.03A\n'
        'Charge Voltage Accuracy: ±0.1V\n\n'
        'Discharging Specifications:\n'
        'Discharge Method: Constant Current (CC)\n'
        'Discharge Current:\n'
        'For 9V - 21V: 0.5 - 10A (adjustable)\n'
        'For 21V - 99V: 0.5 - 20A (adjustable)\n'
        'Discharge Cut-Off Voltage: 9V - 99V (adjustable, 0.1V steps)\n'
        'Discharge Current Accuracy: ±0.03A\n'
        'Discharge Voltage Accuracy: ±0.1V\n\n'
        'Max. Cycle Index:\n'
        '16 Cycles\n\n'
        'Operation Methods:\n'
        'Software-Controlled / Panel-Controlled\n'
        'Battery Connection:\n'
        'Testing Cable with Clamp\n'
        'Communication Port:\n'
        'LAN\n'
        'Product Dimensions & Weight:\n'
        'Size: 45 x 36 x 14.5 cm\n'
        'Weight: 9 kg',

    // Tile 06
    'Resistance Measurement Ranges:\n'
        '3 mΩ (Max: 3.1000 mΩ, Resolution: 0.1 µΩ, Current: 100 mA)\n'
        '30 mΩ (Max: 31.000 mΩ, Resolution: 1 µΩ, Current: 100 mA)\n'
        '300 mΩ (Max: 310.00 mΩ, Resolution: 10 µΩ, Current: 10 mA)\n'
        '3 Ω (Max: 3.1000 Ω, Resolution: 100 µΩ, Current: 1 mA)\n'
        '30 Ω (Max: 31.000 Ω, Resolution: 1 mΩ, Current: 100 µA)\n'
        '300 Ω (Max: 310.00 Ω, Resolution: 10 mΩ, Current: 10 µA)\n'
        '3 kΩ (Max: 3.1000 kΩ, Resolution: 100 mΩ, Current: 10 µA)\n\n'
        'Basic Accuracy: ±0.5% rdg ±10 dgt (3 mΩ range), ±0.5% rdg ±5 dgt (30 mΩ range and higher)\n'
        'Measurement Frequency: 1 kHz ±0.2 Hz\n'
        'Measurement Method: AC Four-Terminal Method\n\n'
        'Voltage Measurement Ranges:\n'
        '6 V (Max: 6.00000 V, Resolution: 10 µV)\n'
        '60 V (Max: 60.0000 V, Resolution: 100 µV)\n'
        '100 V (Max: 100.000 V, Resolution: 1 mV)\n\n'
        'Basic Accuracy: ±0.01% rdg ±3 dgt\n'
        'Response Time: 10 ms\n\n'
        'Sampling Period (Ω or V):\n'
        '60 Hz: 4 ms (EX.FAST), 12 ms (FAST), 35 ms (MEDIUM), 150 ms (SLOW)\n'
        '50 Hz: 4 ms (EX.FAST), 12 ms (FAST), 42 ms (MEDIUM), 157 ms (SLOW)\n\n'
        'Sampling Period (ΩV):\n'
        '60 Hz: 8 ms (EX.FAST), 24 ms (FAST), 70 ms (MEDIUM), 253 ms (SLOW)\n'
        '50 Hz: 8 ms (EX.FAST), 24 ms (FAST), 84 ms (MEDIUM), 259 ms (SLOW)\n\n'
        'Key Functions:\n'
        'Contact Check\n'
        'Zero Adjustment (±1000 counts)\n'
        'Pulse Measurement\n'
        'Comparator (Hi/IN/Lo)\n'
        'Statistical Calculations (Max. 30,000 data points)\n'
        'Delay & Average Calculation\n'
        'Panel Saving/Loading\n'
        'Memory Storage\n'
        'LabVIEW® Driver Support\n\n'
        'Interfaces:\n'
        'LAN (TCP/IP, 10BASE-T/100BASE-TX)\n'
        'RS-232C (Max. 38.4 kbps, Printer Interface Available)\n'
        'EXT I/O (37-pin Handler Interface)\n'
        'Analog Output (DC 0 V to 3.1 V)\n\n'
        'Power Supply:\n'
        '100 to 240 V AC, 50/60 Hz, 35 VA Max.\n\n'
        'Dimensions & Weight:\n'
        'Size: 215 mm (W) × 80 mm (H) × 295 mm (D) (8.46 in × 3.15 in × 11.61 in)\n'
        'Weight: 2.4 kg (84.7 oz)\n\n'
        'Included Accessories:\n'
        'Instruction Manual ×1\n'
        'Power Cord ×1\n'
        'Operating Precautions ×1',

    // Tile 07
    'Cylindrical Cell Configurations:\n'
        'NMC:\n'
        '14S 1P (5Ah)\n'
        '14S 2P (10Ah)\n\n'
        'LFP:\n'
        '15S 1P (5Ah)\n'
        '15S 2P (10Ah)',

    // Tile 08
    'Terminal Leads for connecting packs from the thermal chamber to the bench\n'
        'Safety Enclosure for each pack\n'
        'Pack Storage Trays\n'
        'Pack Balancer Circuit',

    // Tile 09
    'Specifications:\n'
        'Material of Construction:\n'
        'Inside: Stainless Steel (S.S. 304, mirror polished)\n'
        'Outside: Stainless Steel (S.S. 304, matt polished)\n'
        'Insulation: PUF insulation\n\n'
        'Air Circulation:\n'
        'Forced air circulation for uniform temperature, powered by suction blower with fan\n\n'
        'Observation Door:\n'
        'Inside observation door made of acrylic/glass\n\n'
        'Handle and Hinges:\n'
        'Handle and hinges ensure positive sealing with a lock and key arrangement\n\n'
        'Port Holes:\n'
        'Both sides equipped with port holes and rubber seals for sensor insertion\n\n'
        'Lighting:\n'
        'Interior illumination for the working area\n\n'
        'Heating System:\n'
        'Tubular finned type heaters suitable for both dry and wet environments\n\n'
        'Humidity System:\n'
        'Steam injection; based on the dry and wet bulb principle\n\n'
        'Refrigeration System:\n'
        'Emerson or equivalent make; evaporation coil with fan-cooled condenser\n\n'
        'Control System:\n'
        'HMI/PLC system with pen drive compatibility and printer attachment\n'
        '7” HMI color touch screen\n'
        'Programmable Ramp/Soak type with 10 programs (20 steps each)\n'
        'Supports up to 999 cycles\n\n'
        'Sensor:\n'
        'Humidity and Temperature sensors\n\n'
        'Safety Features:\n'
        'Float switch to cut off mains supply in case of low water level in the boiler tank\n'
        'Safety thermostat in the evaporation tray to cut off heater supply in case of low water level\n'
        'Dedicated safety controller/thermostat with a separate sensor for overshoot and undershoot protection, with audio-visual alarm\n'
        '2-minute compressor "ON" delay timer to protect the compressor\n\n'
        'Trays:\n'
        'Adjustable rod trays (03 Nos.)\n\n'
        'Finish:\n'
        'Internal: Mirror polished\n'
        'External: Powder coated\n\n'
        'Additional Features:\n'
        'Castor wheels for mobility\n'
        'Adjustable tray height arrangement\n'
        'Heavy-duty latch with lock & key\n'
        'MCB for safety\n\n'
        'Power Supply:\n'
        '230V AC, single-phase, 50 Hz\n\n'
        'Performance:\n'
        'Temperature Range:\n'
        '-20°C to +80°C\n'
        'Humidity Range:\n'
        '30% to 85% RH\n'
        'Temperature Accuracy:\n'
        '±0.2°C\n'
        'Temperature Uniformity:\n'
        '±1°C\n'
        'Humidity Accuracy:\n'
        '±2% RH or better\n\n'
        'Dimensions:\n'
        'Inner Size (W x D x H):\n'
        '50 x 50 x 80 cm (200 Lit.)',

    // Tile 10
    'Product Features - Hardware Kit 2:\n'
        'Microcontroller Platform:\n'
        'NXP S32K\n'
        'Number of Cells:\n'
        '16\n'
        'Cell Chemistry Options:\n'
        'NMC & LFP\n'
        'Voltage & Current Measurement:\n'
        'NXP AFE & Hall/Shunt based\n'
        'Temperature Sensing:\n'
        'Max. 6\n'
        'Maximum Current Handling:\n'
        '80A (Configurable)\n'
        'Cutoff Options:\n'
        'Contactor based\n'
        'Protection Features:\n'
        'Available\n'
        'CAN Communication:\n'
        'Yes (2 channels)\n'
        'Fault Indication:\n'
        'LED based\n'
        'Charging Profile Configuration:\n'
        'Yes (CAN based)\n'
        'SOC Estimation:\n'
        'OCV/CC/CV + EKF\n'
        'SOH Monitoring:\n'
        'Impedance testing\n'
        'Cell Balancing:\n'
        'Yes (Passive, 82Ω)',

    // Tile 11
    'Product Features - Hardware Kit 3:\n'
        'Microcontroller Platform:\n'
        'NXP S32K\n'
        'Number of Cells:\n'
        '16\n'
        'Cell Chemistry Options:\n'
        'NMC & LFP\n'
        'Voltage & Current Measurement:\n'
        'NXP AFE & Hall/Shunt based\n'
        'Temperature Sensing:\n'
        'Max. 6\n'
        'Maximum Current Handling:\n'
        '80A (Configurable)\n'
        'Cutoff Options:\n'
        'Contactor based\n'
        'Protection Features:\n'
        'Available\n'
        'CAN Communication:\n'
        'Yes (2 channels)\n'
        'Fault Indication:\n'
        'LED based\n'
        'Charging Profile Configuration:\n'
        'Yes (CAN based)\n'
        'SOC Estimation:\n'
        'OCV/CC/CV + EKF\n'
        'SOH Monitoring:\n'
        'Impedance testing\n'
        'Cell Balancing:\n'
        'Yes (Passive, 82Ω)',

    // Tile 12
    'Industry-Ready Calibrated BMS Algorithm:\n\n'
        'Model-Based Design (MBD): Compliant with MBD standards.\n'
        'Testing Compliance: Meets Model-in-the-Loop (MIL), Software-in-the-Loop (SIL), and Processor-in-the-Loop (PIL) testing requirements.\n'
        'Code Generation & Deployment: Ready for code generation and deployment.\n'
        'State of Charge (SOC) Algorithm: Included.\n'
        'State of Health (SOH) Algorithm: Included.\n'
        'Cell Balancing Algorithm: Included.\n'
        'Safety Interlocks: Incorporated.',
  ];


  final List<String> imagePath = [
    'lib/images/equipments/liIonTest.png',
    'lib/images/equipments/impedanceAnalyzer.png',
    'lib/images/equipments/cellsForTesting.jpg',
    'lib/images/equipments/fixtureForCellTesting.png',
    'lib/images/equipments/liIonPackTestingChrgDischrg.jpg',
    'lib/images/equipments/PackACIRTestingLab.jpg',
    '', // IMAGE NOT PROVIDED
    'lib/images/equipments/wiring&FixtureTesting.png',
    'lib/images/equipments/environmentalChamber.jpg',
    'lib/images/equipments/singleCellBMS.png',
    'lib/images/equipments/multiCellBMS.jpg',
    'lib/images/equipments/bmsAlgSoftwares.jpg',
  ];
}
