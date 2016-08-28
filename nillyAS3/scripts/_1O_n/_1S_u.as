package _1O_n
{
   import _1H_T_._T_U_;
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.objects.Player;
   
   public class _1S_u extends _zL_
   {
       
      
      private const _1__z:uint = 8;
      
      private var _1ta:Vector.<_T_U_>;
      
      private var _0qy:Boolean;
      
      public function _1S_u(param1:GameObject, param2:Player, param3:int = 0, param4:Boolean = false)
      {
         var _loc5_:_T_U_ = null;
         var _loc6_:int = 0;
         super(param1,param2,param3);
         this._1ta = new Vector.<_T_U_>(this._1__z);
         this._0qy = param4;
         while(_loc6_ < this._1__z)
         {
            _loc5_ = new _T_U_(_loc6_ + _0I_K_,this,_M___);
            _loc5_._11U_(_loc6_ + 1);
            _0gI_(_loc5_,2,_loc6_);
            this._1ta[_loc6_] = _loc5_;
            _loc6_++;
         }
      }
      
      override public function setItems(param1:Vector.<int>, param2:int = 0) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1)
         {
            _loc3_ = false;
            _loc4_ = param1.length;
            _loc5_ = 0;
            while(_loc5_ < this._1__z)
            {
               if(_loc5_ + _0I_K_ < _loc4_)
               {
                  if(this._1ta[_loc5_].setItem(param1[_loc5_ + _0I_K_]))
                  {
                     _loc3_ = true;
                  }
               }
               else if(this._1ta[_loc5_].setItem(-1))
               {
                  _loc3_ = true;
               }
               _loc5_++;
            }
            if(_loc3_)
            {
               _0nI_();
            }
         }
      }
   }
}
