package _0cH_
{
   import com.company.assembleegameclient.objects._sV_;
   import com.company.assembleegameclient.objects.Portrait;
   
   public class _0tY_
   {
       
      
      public var time_:int;
      
      public var _1B_5:_sV_;
      
      public function _0tY_(param1:XML)
      {
         super();
         this.time_ = int(Number(param1.@time) * 1000);
         this._1B_5 = new Portrait(param1);
      }
   }
}
