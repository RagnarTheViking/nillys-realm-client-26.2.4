package _0E_T_
{
   public class _1G_k
   {
      
      public static const OWNED:_0E_T_._1G_k = new _0E_T_._1G_k(false,"OWNED",false);
      
      public static const UNLISTED:_0E_T_._1G_k = new _0E_T_._1G_k(true,"UNLISTED",false);
      
      public static const PURCHASABLE:_0E_T_._1G_k = new _0E_T_._1G_k(false,"PURCHASABLE",true);
      
      public static const PURCHASING:_0E_T_._1G_k = new _0E_T_._1G_k(true,"PURCHASING",true);
      
      public static const LOCKED:_0E_T_._1G_k = new _0E_T_._1G_k(true,"LOCKED",true);
      
      public static const NULL:_0E_T_._1G_k = new _0E_T_._1G_k(true,"NULL",true);
       
      
      private var _tn:Boolean;
      
      private var _wW_:Boolean;
      
      private var name:String;
      
      public function _1G_k(param1:Boolean, param2:String, param3:Boolean)
      {
         super();
         this._tn = param1;
         this._wW_ = param3;
         this.name = param2;
      }
      
      public function _Y_O_() : Boolean
      {
         return this._tn;
      }
      
      public function _0H_d() : Boolean
      {
         return this._wW_;
      }
      
      public function toString() : String
      {
         return "[CharacterSkinState {NAME}]".replace("{NAME}",this.name);
      }
   }
}
