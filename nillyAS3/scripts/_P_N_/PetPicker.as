package _P_N_
{
   import _f7.Signal;
   import _1F_z._1Z_D_;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class PetPicker extends _0K_x implements _1ay
   {
       
      
      [Inject]
      public var _3q:_P_N_._7V_;
      
      public var _132:Signal;
      
      private var _0fq:Vector.<_P_N_._Q_L_>;
      
      private var _1G_c:int;
      
      public function PetPicker()
      {
         this._132 = new _1oV_();
         super();
      }
      
      private static function _0wj(param1:_P_N_._Q_L_, param2:_P_N_._Q_L_) : int
      {
         var _loc3_:int = param1.getPetVO()._0qB_[0].points;
         var _loc4_:int = param2.getPetVO()._0qB_[0].points;
         return _loc4_ - _loc3_;
      }
      
      public function _fb(param1:Vector.<_1Z_D_>) : void
      {
         this._05R_(param1);
         this._0K_Z_();
         this._10A_();
      }
      
      private function _0K_Z_() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Array = [];
         for each(_loc1_ in this._0fq)
         {
            _loc2_.push(_loc1_);
         }
         setItems(_loc2_);
      }
      
      private function _05R_(param1:Vector.<_1Z_D_>) : void
      {
         var _loc2_:_1Z_D_ = null;
         this._0fq = new Vector.<_P_N_._Q_L_>();
         for each(_loc2_ in param1)
         {
            this._G_s(_loc2_);
         }
         this._0fq.sort(_0wj);
      }
      
      private function _10A_() : void
      {
         this._K_o(_076(),_P_N_._Q_L_._px);
         this._K_o(_1t8(),_P_N_._Q_L_._1uo);
         this._K_o(_0D_W_(),_P_N_._Q_L_._1z__);
         this._K_o(_0qb(),_P_N_._Q_L_._1E_4);
      }
      
      private function _K_o(param1:DisplayObject, param2:String) : void
      {
         if(param1)
         {
            _Q_L_(param1)._04o(param2);
         }
      }
      
      public function _N_r(param1:int) : void
      {
         this._1G_c = param1;
      }
      
      public function _0N_1() : Vector.<_P_N_._Q_L_>
      {
         return this._0fq;
      }
      
      public function _0oU_(param1:int) : _P_N_._Q_L_
      {
         return this._0fq[param1];
      }
      
      public function _1Y_7(param1:_1Z_D_) : void
      {
         var _loc2_:_1Z_D_ = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._0fq.length)
         {
            _loc2_ = this._0fq[_loc3_].getPetVO();
            if(!this._iY_(param1,_loc2_))
            {
               this._0fq[_loc3_].disable();
            }
            _loc3_++;
         }
      }
      
      public function _04P_(param1:_1Z_D_) : void
      {
         var _loc2_:_1Z_D_ = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._0fq.length)
         {
            _loc2_ = this._0fq[_loc3_].getPetVO();
            if(_loc2_._0__5() == param1._0__5())
            {
               this._0fq[_loc3_].disable();
            }
            _loc3_++;
         }
      }
      
      private function _iY_(param1:_1Z_D_, param2:_1Z_D_) : Boolean
      {
         return param1._1lu() == param2._1lu() && param1._1b8() == param2._1b8();
      }
      
      private function _G_s(param1:_1Z_D_) : void
      {
         var pet:_1B_G_ = null;
         var pet_clickHandler:Function = null;
         var petVO:_1Z_D_ = param1;
         pet_clickHandler = function(param1:MouseEvent):void
         {
            if(pet.isEnabled())
            {
               _132.dispatch(petVO);
            }
         };
         pet = this._3q.create(petVO,this._1G_c);
         this._0fq.push(pet);
         pet.addEventListener(MouseEvent.CLICK,pet_clickHandler);
      }
   }
}
