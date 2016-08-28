package _1O_n
{
   import _1H_T_._S_A_;
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.objects.Player;
   
   public class _u0 extends _zL_
   {
       
      
      private const _1__z:uint = 8;
      
      private var _1ta:Vector.<_S_A_>;
      
      public function _u0(param1:GameObject, param2:Player)
      {
         var _loc3_:_S_A_ = null;
         var _loc4_:int = 0;
         super(param1,param2,0);
         this._1ta = new Vector.<_S_A_>(this._1__z);
         while(_loc4_ < this._1__z)
         {
            _loc3_ = new _S_A_(_loc4_ + _0I_K_,this,_M___);
            _0gI_(_loc3_,2,_loc4_);
            this._1ta[_loc4_] = _loc3_;
            _loc4_++;
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
