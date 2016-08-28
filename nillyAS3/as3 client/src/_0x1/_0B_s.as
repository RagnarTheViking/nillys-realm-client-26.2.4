package _0x1
{
   public class _0B_s extends _O_y
   {
       
      
      private var _0H_g:Number;
      
      public function _0B_s(param1:int, param2:int, param3:int, param4:Number, param5:Number, param6:Number, param7:Number)
      {
         this._0H_g = param4;
         super(param1,param2,param3,param5,param6,param7);
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         timeLeft_ = timeLeft_ - param2;
         if(timeLeft_ <= 0)
         {
            return false;
         }
         if(square_.obj_ && square_.obj_.props_.static_)
         {
            return false;
         }
         var _loc4_:Number = Math.random() * this._0H_g;
         _loc3_ = Math.random() * this._0H_g;
         x_ = x_ + dx_ * _loc4_ * param2 / 1000;
         y_ = y_ + dy_ * _loc3_ * param2 / 1000;
         setSize(timeLeft_ / lifetime_ * initialSize_);
         return true;
      }
   }
}
