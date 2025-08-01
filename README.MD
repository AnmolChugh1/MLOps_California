Objective

Build a complete MLOps pipeline focused on Linear Regression only, integrating training, testing,
quantization, Dockerization, and CI/CD — all managed within a single main branch.


1. Worked on Creating Directory as follows

MLOps_California/
├── .github/workflows/         # GitHub Actions CI/CD workflows
├── src/                       # Source code
│   ├── train.py               # Train the regression model
│   ├── test_train.py          # Pytest-based unit tests for the pipeline
│   ├── predict.py             # Run inference on new data
│   ├── quantize.py            # Manual model quantization
│   └── utils.py               # Helper functions
├── model.joblib               # Trained model artifact
├── unquant_params.joblib      # Pre-quantized model coefficients
├── quant_params.joblib        # Quantized model coefficients
├── Requirements.txt           # Python dependencies
├── Dockerfile                 # Docker setup for containerization
├── .gitignore                 # Ignored files in git
└── README.md                  # Project documentation


  2. Initially rain with train.py file in src folder the following result was obtained
python src/train.py
R² Score: 0.5758
MSE: 0.5559

  3. Ran test_train.py file 

pytest src/test_train.py
============================================================ test session starts =============================================================
platform win32 -- Python 3.10.18, pytest-8.4.1, pluggy-1.6.0
rootdir: C:\Users\anmol\MLOps_California
collected 2 items                                                                                                                             

src\test_train.py ..                                                                                                                    [100%]

============================================================= 2 passed in 1.99s ============================================================== 



  4. Ran file quantize.py in src folder 
python src/quantize.py
Sample inference output: -36.92783737557349



  5. Created A Docker File which worked as follows: -

 Loading the trained Linear Regression model...
 Fetching the test data...
 Generating predictions on test data...

 Model Evaluation Metrics:
 - R² Score            : 0.5758
 - Mean Squared Error  : 0.5559

 Sample Predictions:
   ▶ True: 0.48 | Predicted: 0.72 | Error: 0.24
   ▶ True: 0.46 | Predicted: 1.76 | Error: 1.31
   ▶ True: 5.00 | Predicted: 2.71 | Error: 2.29
   ▶ True: 2.19 | Predicted: 2.84 | Error: 0.65
   ▶ True: 2.78 | Predicted: 2.60 | Error: 0.18
   ▶ True: 1.59 | Predicted: 2.01 | Error: 0.42
   ▶ True: 1.98 | Predicted: 2.65 | Error: 0.66
   ▶ True: 1.57 | Predicted: 2.17 | Error: 0.59
   ▶ True: 3.40 | Predicted: 2.74 | Error: 0.66
   ▶ True: 4.47 | Predicted: 3.92 | Error: 0.55

 Prediction process completed successfully.

 6. Comparison Table

  Metric	Original Model	Quantized Model	Difference
  R² Score	0.5758	         0.5758	     0.0000
  MSE	    0.5559	         0.5559	     0.0000


 7. Below are the Docker commands used in ci.yml and on every push this CI/CD workflow will start building the image then   create and start the container.
      docker build -t mlops_pipeline .

    docker run --rm mlops_pipeline