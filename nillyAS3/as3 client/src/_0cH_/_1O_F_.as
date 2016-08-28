package _0cH_
{
   public class _1O_F_
   {
       
      
      public var _1v7:Vector.<_0cH_._0N_3>;
      
      public function _1O_F_(param1:XML)
      {
         var _loc2_:XML = null;
         this._1v7 = new Vector.<_0cH_._0N_3>();
         super();
         for each(_loc2_ in param1.Animation)
         {
            this._1v7.push(new _0cH_._0N_3(_loc2_));
         }
      }
   }
}
