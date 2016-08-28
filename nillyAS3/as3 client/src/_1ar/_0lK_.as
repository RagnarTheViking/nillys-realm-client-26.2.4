package _1ar
{
   public class _0lK_
   {
       
      
      private var _5G_:Vector.<_1ar._0S_l>;
      
      private var _0U_e:int = 0;
      
      public function _0lK_()
      {
         this._5G_ = new Vector.<_1ar._0S_l>();
         super();
      }
      
      public function _X_w(param1:_1ar._0S_l) : void
      {
         this._5G_.length = this._0U_e;
         param1.execute();
         this._5G_.push(param1);
         this._0U_e++;
      }
      
      public function _1dv() : void
      {
         if(this._0U_e == 0)
         {
            return;
         }
         this._5G_[--this._0U_e].unexecute();
      }
      
      public function _169() : void
      {
         if(this._0U_e == this._5G_.length)
         {
            return;
         }
         this._5G_[this._0U_e++].execute();
      }
      
      public function clear() : void
      {
         this._0U_e = 0;
         this._5G_.length = 0;
      }
   }
}
