This is the source code of  Flying Fish Algorithm written in MATLAB.

This study proposes the Flying Fish Algorithm (FFA), a novel population-based metaheuristic developed to solve complex optimization problems by emphasizing clearly defined algorithmic mechanisms. Inspired by two fundamental behaviors observed in flying fish, namely resource-seeking and evasive movement. These behaviors are modeled as two complementary search strategies: foraging (exploitation) and flight (exploration). 

<img width="515" height="237" alt="image" src="https://github.com/user-attachments/assets/a9b454d8-6971-4851-a89b-dca86fa6ed0d" />


FFA alternates between foraging /exploitation and predator-escape/exploration mechanisms according to the adaptive value of v, which denotes the speed of the flying fishes (dual transition mechanism), with additional fish's failure rates (FFRs) behavior.
The FFA algorithm is summed up in the following highlights.

	The exploitation phase consists of the feeding moment of the flying fish without any danger, such as a predator and Lévy flight-motion-based movement toward the elite solution is used (Eq. (10)).
	The exploration phase uses predator-escape equations (Eq. (11) and Eq. (12)).
	A key innovation of the FFA algorithm lies in its dual transition mechanism guaranteed by the adaptive value of v, which denotes the speed of the flying fishes, allowing agents to dynamically switch between foraging and flight modes. 
	FFA uses parameters discharge angle values T1 and T2, the control factor Q, and the fish's failure rates (FFRs).
	In the exploitation phase, when the predator and flying fish locations become close to each other and the step length is going to be small, FFRs's effect, along with long steps of the Lévy strategy, greatly helps FFA to avoid local optima stagnation and better performance of the method. Then, FFRs continuously monitors system parameters and automatically adjusts to ensure a stable and reliable operation.

The performance of FFA was evaluated using 74 benchmark optimization problems, including unimodal, multimodal, and CEC 2022 test functions, as well as seven engineering design problems. Comparative results with the several popular algorithms (PSO, SHADE, JADE, GWO, HHO, MPA, GOA, SCSO, RIME, SMA, EDO, ECO, and MGO) considered in this study demonstrate that FFA achieves competitive and, often, superior solutions across most test cases. Statistical validation using multiple performance indicators and the Friedman test confirms the robustness and effectiveness of the proposed method. These findings indicate that FFA provides an efficient and reliable optimization framework with potential applicability to real-world engineering optimization problems.

The paper is available to researchers on request at: djougou1994@gmail.com


