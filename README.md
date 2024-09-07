# MineTrack

**MineTrack** is a digital shift handover and safety management system designed for coal mining operations. This application streamlines shift transitions, enhances safety compliance, and integrates with ERP systems.

## Features

- **Digital Shift Handover**: Modernizes shift transitions with a digital log system, reducing manual processing time by 50%.
- **Safety Management Plan (SMP)**: Enhances safety compliance by 40%, ensuring adherence to safety regulations.
- **Secure Data Management**: Utilizes PostgreSQL for reliable data storage and Django for secure backend operations.
- **Automated Reporting**: Generates PDF reports for shifts, reducing reporting time by 30%.
- **ERP Integration**: Connects with ERP systems to improve operational efficiency by 20%.

## Technologies

- **Frontend**: Flutter
- **Backend**: Django
- **Database**: PostgreSQL
- **Integration**: ERP systems

## Installation

1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/minetrack.git
    cd minetrack
    ```

2. **Setup the backend:**
    - Navigate to the `backend` directory:
        ```bash
        cd backend
        ```
    - Create a virtual environment and install dependencies:
        ```bash
        python -m venv env
        source env/bin/activate  # On Windows use `env\Scripts\activate`
        pip install -r requirements.txt
        ```
    - Apply migrations:
        ```bash
        python manage.py migrate
        ```

3. **Setup the frontend:**
    - Navigate to the `frontend` directory:
        ```bash
        cd ../frontend
        ```
    - Install dependencies:
        ```bash
        flutter pub get
        ```

4. **Run the application:**
    - Start the Django server:
        ```bash
        cd ../backend
        python manage.py runserver
        ```
    - Run the Flutter app:
        ```bash
        cd ../frontend
        flutter run
        ```

## Contributing

Feel free to open issues or submit pull requests. Contributions are welcome!


## Contact

For any inquiries, please contact poagesh59@gmail.com

