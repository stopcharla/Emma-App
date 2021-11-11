export interface Transaction {
  id: number;
  user_id: number;
  date: string;
  amount: number;
  description: string;
  merchant_id: number;
}
