import { MerchantCreationAttributes } from './models/merchants.model';
import { UserCreationAttributes } from './models/users.model';

export const users: UserCreationAttributes[] = [
  { first_name: 'John', last_name: 'Doe' },
  { first_name: 'John', last_name: 'Wick' },
  { first_name: 'Jerry', last_name: 'Sienfield' },
  { first_name: 'Larry', last_name: 'David' },
];

export const merchants: MerchantCreationAttributes[] = [
  { display_name: 'Papa Jones', funny_gif_url: 'www://google.com', icon_url: 'www://google.com' },
  { display_name: 'Apple Subscriptions', funny_gif_url: 'www://google.com', icon_url: 'www://google.com' },
];
