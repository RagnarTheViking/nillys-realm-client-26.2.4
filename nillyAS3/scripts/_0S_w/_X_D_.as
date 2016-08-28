package _0S_w
{
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.util._18U_;
   
   class _X_D_ extends _0Z_o
   {
       
      
      function _X_D_()
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:XML = null;
         var _loc4_:_18m = null;
         super(_F_B_._W_a);
         var _loc5_:Vector.<String> = new Vector.<String>();
         for(_loc1_ in ObjectLibrary._07h)
         {
            _loc5_.push(_loc1_);
         }
         _loc5_.sort(_18U_._O_);
         for each(_loc1_ in _loc5_)
         {
            _loc2_ = ObjectLibrary._07h[_loc1_];
            _loc3_ = ObjectLibrary.XmlData[_loc2_];
            if(!(_loc3_.hasOwnProperty("Item") || _loc3_.hasOwnProperty("Player") || _loc3_.Class == "Projectile"))
            {
               _loc4_ = new _18m(_loc3_);
               _0y9(_loc4_);
            }
         }
      }
   }
}
