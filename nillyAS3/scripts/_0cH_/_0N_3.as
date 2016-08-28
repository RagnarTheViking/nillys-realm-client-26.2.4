package _0cH_
{
   public class _0N_3
   {
       
      
      public var _1gb:Number = 1;
      
      public var period_:int;
      
      public var _0r2:int;
      
      public var _tH_:Boolean = false;
      
      public var _M_s:Vector.<_0cH_._0tY_>;
      
      public function _0N_3(param1:XML)
      {
         var _loc2_:XML = null;
         this._M_s = new Vector.<_0cH_._0tY_>();
         super();
         if("@prob" in param1)
         {
            this._1gb = Number(param1.@prob);
         }
         this.period_ = int(Number(param1.@period) * 1000);
         this._0r2 = int(Number(param1.@periodJitter) * 1000);
         this._tH_ = String(param1.@sync) == "true";
         for each(_loc2_ in param1.Frame)
         {
            this._M_s.push(new _0cH_._0tY_(_loc2_));
         }
      }
      
      private function _J_e() : int
      {
         if(this._0r2 == 0)
         {
            return this.period_;
         }
         return this.period_ - this._0r2 + 2 * Math.random() * this._0r2;
      }
      
      public function _1W_7(param1:int) : int
      {
         if(this._tH_)
         {
            return int(param1 / this.period_) * this.period_;
         }
         return param1 + this._J_e() + 200 * Math.random();
      }
      
      public function _1I_h(param1:int) : int
      {
         if(this._tH_)
         {
            return int(param1 / this.period_) * this.period_ + this.period_;
         }
         return param1 + this._J_e();
      }
   }
}
