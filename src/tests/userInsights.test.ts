import { Sequelize } from 'sequelize';
import request from 'supertest';
import App from '@/app';
import UserInsightsRoute from '@/routes/userInsights.route';

jest.mock('sequelize');

afterAll(async () => {
  await new Promise<void>(resolve => setTimeout(() => resolve(), 500));
});

describe('Testing Users Insights', () => {
  describe('[GET] /userInsights', () => {
    it('response find userInsights', async () => {
      const userInsightsRoute = new UserInsightsRoute();
      const userInsights = userInsightsRoute.userInsightsController.userInsightsService;

      userInsights.getUserInsights = jest.fn().mockReturnValue([
        {
          merchant_id: 1,
          percentile: 0.33,
        },
        {
          merchant_id: 2,
          percentile: 0.33,
        },
      ]);

      (Sequelize as any).authenticate = jest.fn();
      const app = new App([userInsightsRoute]);

      await request(app.getServer()).get(`${userInsightsRoute.path}?userId=1&&from=2021-11-06&to=2021-11-08`).expect(200);

      expect(userInsights.getUserInsights).toHaveBeenCalledTimes(1);
      expect(userInsights.getUserInsights).toHaveBeenCalledWith(1, '2021-11-06', '2021-11-08');
    });

    it('response find userInsights', async () => {
      const userInsightsRoute = new UserInsightsRoute();
      const userInsights = userInsightsRoute.userInsightsController.userInsightsService;

      userInsights.getUserInsights = jest.fn().mockReturnValue([
        {
          merchant_id: 1,
          percentile: 0.33,
        },
        {
          merchant_id: 2,
          percentile: 0.33,
        },
      ]);

      (Sequelize as any).authenticate = jest.fn();
      const app = new App([userInsightsRoute]);
      await request(app.getServer()).get(`${userInsightsRoute.path}?userId=1&&from=2021-11-06&to=2021-11-08`).expect(200);

      expect(userInsights.getUserInsights).toHaveBeenCalledTimes(1);
      expect(userInsights.getUserInsights).toHaveBeenCalledWith(1, '2021-11-06', '2021-11-08');
    });

    it('response should return 400 users', async () => {
      const userInsightsRoute = new UserInsightsRoute();
      const userInsights = userInsightsRoute.userInsightsController.userInsightsService;

      userInsights.getUserInsights = jest.fn();

      (Sequelize as any).authenticate = jest.fn();

      const app = new App([userInsightsRoute]);
      await request(app.getServer()).get(`${userInsightsRoute.path}?userId=1&&from=&to=`).expect(400);

      expect(userInsights.getUserInsights).toHaveBeenCalledTimes(0);
    });

    it('response should return 400 users', async () => {
      const userInsightsRoute = new UserInsightsRoute();
      const userInsights = userInsightsRoute.userInsightsController.userInsightsService;

      userInsights.getUserInsights = jest.fn();

      (Sequelize as any).authenticate = jest.fn();

      const app = new App([userInsightsRoute]);
      await request(app.getServer()).get(`${userInsightsRoute.path}?userId=1&&from=2021-11-08&to=`).expect(400);

      expect(userInsights.getUserInsights).toHaveBeenCalledTimes(0);
    });
  });
});
