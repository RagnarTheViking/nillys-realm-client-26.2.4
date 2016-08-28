package _1F_z
{
   import _0l7._15g;
   import _v4.Client;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   
   public class _0P_4
   {
       
      
      [Inject]
      public var _ak:_15g;
      
      [Inject]
      public var _0U_H_:Client;
      
      private var hash:Object;
      
      private var pets:Vector.<_1F_z._1Z_D_>;
      
      private var _0dh:XML;
      
      private var type:int;
      
      private var _1zW_:_1F_z._1Z_D_;
      
      public function _0P_4()
      {
         this.hash = {};
         this.pets = new Vector.<_1F_z._1Z_D_>();
         super();
      }
      
      public function getPetVO(param1:int) : _1F_z._1Z_D_
      {
         var _loc2_:_1F_z._1Z_D_ = null;
         if(this.hash[param1] != null)
         {
            return this.hash[param1];
         }
         _loc2_ = new _1F_z._1Z_D_(param1);
         this.pets.push(_loc2_);
         this.hash[param1] = _loc2_;
         return _loc2_;
      }
      
      public function _0H_F_(param1:int) : _1F_z._1Z_D_
      {
         return this.hash[param1];
      }
      
      public function _0lX_() : Vector.<_1F_z._1Z_D_>
      {
         return this.pets;
      }
      
      public function _G_s(param1:_1F_z._1Z_D_) : void
      {
         this.pets.push(param1);
      }
      
      public function _1mB_(param1:_1F_z._1Z_D_) : void
      {
         this._1zW_ = param1;
         var _loc2_:SavedCharacter = this._0U_H_.getCharacter(this._0U_H_._1U_H_);
         if(_loc2_)
         {
            _loc2_._1jr(this._1zW_);
         }
         this._ak.dispatch();
      }
      
      public function _0T_T_() : _1F_z._1Z_D_
      {
         return this._1zW_;
      }
      
      public function _0X_k() : void
      {
         var _loc1_:SavedCharacter = this._0U_H_.getCharacter(this._0U_H_._1U_H_);
         if(_loc1_)
         {
            _loc1_._1jr(null);
         }
         this._1zW_ = null;
         this._ak.dispatch();
      }
      
      public function _0oU_(param1:int) : _1F_z._1Z_D_
      {
         var _loc2_:int = this._0xc(param1);
         if(_loc2_ == -1)
         {
            return null;
         }
         return this.pets[_loc2_];
      }
      
      private function _0xc(param1:int) : int
      {
         var _loc2_:_1F_z._1Z_D_ = null;
         var _loc3_:uint = 0;
         while(_loc3_ < this.pets.length)
         {
            _loc2_ = this.pets[_loc3_];
            if(_loc2_._0__5() == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function _0C_9(param1:int) : void
      {
         this.type = param1;
         this._0dh = ObjectLibrary._0W_b(ObjectLibrary._M_(param1));
      }
      
      public function _0f__() : uint
      {
         return _A_H_._0Q_J_(this._0dh.@id).rarity._V_B_;
      }
      
      public function _0x3() : int
      {
         return !!this._0dh?int(_A_H_._0Q_J_(this._0dh.@id)._V_B_):1;
      }
      
      public function _1O_K_() : int
      {
         return int(this._0dh.Fame);
      }
      
      public function _0P_S_() : int
      {
         return int(this._0dh.Price);
      }
      
      public function _0tS_() : int
      {
         return this.type;
      }
      
      public function _1P_6(param1:int) : void
      {
         this.pets.splice(this._0xc(param1),1);
      }
      
      public function _11i() : void
      {
         this.hash = {};
         this.pets = new Vector.<_1F_z._1Z_D_>();
         this._0X_k();
      }
   }
}
