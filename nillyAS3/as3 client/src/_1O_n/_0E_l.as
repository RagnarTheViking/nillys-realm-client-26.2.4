package _1O_n
{
   import _1H_T_._1Z_h;
   import com.company.util._0ov;
   import com.company.util._1G_U_;
   import _09j._1so;
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.objects.Player;
   
   public class _0E_l extends _zL_
   {
      
      public static const _1__z:uint = 4;
       
      
      private var _1ta:Vector.<_1Z_h>;
      
      public function _0E_l(param1:GameObject, param2:Vector.<int>, param3:Player, param4:int = 0)
      {
         var _loc5_:_1Z_h = null;
         var _loc6_:int = 0;
         super(param1,param3,param4);
         this._1ta = new Vector.<_1Z_h>(_1__z);
         while(_loc6_ < _1__z)
         {
            _loc5_ = new _1Z_h(_loc6_,this,_M___);
            _0gI_(_loc5_,1,_loc6_);
            _loc5_.setType(param2[_loc6_]);
            this._1ta[_loc6_] = _loc5_;
            _loc6_++;
         }
      }
      
      public function _1nN_() : _0ov
      {
         return new _1G_U_(_1so.toArray(this._1ta));
      }
      
      override public function setItems(param1:Vector.<int>, param2:int = 0) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1)
         {
            _loc3_ = param1.length;
            _loc4_ = 0;
            while(_loc4_ < this._1ta.length)
            {
               if(_loc4_ + param2 < _loc3_)
               {
                  this._1ta[_loc4_].setItem(param1[_loc4_ + param2]);
               }
               else
               {
                  this._1ta[_loc4_].setItem(-1);
               }
               this._1ta[_loc4_].updateDim(curPlayer);
               _loc4_++;
            }
         }
      }
   }
}
