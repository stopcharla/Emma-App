import { Router } from 'express';
import UserInsightsController from '@controllers/userInsights.controller';
import { Routes } from '@interfaces/routes.interface';

class UsersRoute implements Routes {
  public path = '/userInsights';
  public router = Router();
  public userInsightsController = new UserInsightsController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(`${this.path}`, this.userInsightsController.getInsights);
  }
}

export default UsersRoute;
