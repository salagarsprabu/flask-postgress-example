from app import db
from app.models import User

if __name__ == '__main__':
    db.create_all()
