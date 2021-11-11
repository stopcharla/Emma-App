import { NextFunction, Request, Response } from 'express';
import userInsightsService from '@services/userInsights.service';
import { isEmpty, isInvalidDateRange } from '@utils/util';
import { HttpException } from '@exceptions/HttpException';

class UserInsightsController {
  public userInsightsService = new userInsightsService();

  public getInsights = async (req: Request, res: Response, next: NextFunction) => {
    try {
      console.log(req.query);
      if (
        isEmpty(Number(req.query.userId)) ||
        isEmpty(req.query.from as string) ||
        isEmpty(req.query.to as string) ||
        isInvalidDateRange(req.query.from as string, req.query.to as string)
      )
        throw new HttpException(400, 'Something is wrong');
      const userInsights = await this.userInsightsService.getUserInsights(Number(req.query.userId), req.query.from as string, req.query.to as string);
      res.status(200).json({ data: userInsights, message: 'user insights' });
    } catch (error) {
      next(error);
    }
  };
}

export default UserInsightsController;
