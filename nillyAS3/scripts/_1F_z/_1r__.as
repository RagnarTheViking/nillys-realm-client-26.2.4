package _1F_z
{
   public class _1r__
   {
      
      public static const _1uO_:_1F_z._1r__ = new _1F_z._1r__("Pets.common",0);
      
      public static const _b0:_1F_z._1r__ = new _1F_z._1r__("Pets.uncommon",1);
      
      public static const _06T_:_1F_z._1r__ = new _1F_z._1r__("Pets.rare",2);
      
      public static const _1Z_n:_1F_z._1r__ = new _1F_z._1r__("Pets.legendary",3);
      
      public static const _99:_1F_z._1r__ = new _1F_z._1r__("Pets.divine",4);
      
      public static const _1C_Y_:int = 4;
       
      
      public var value:String;
      
      public var _V_B_:int;
      
      public function _1r__(param1:*, param2:int)
      {
         super();
         this.value = param1;
         this._V_B_ = param2;
      }
      
      public static function get list() : Array
      {
         return [_1uO_,_b0,_06T_,_1Z_n,_99];
      }
      
      public static function _0Q_J_(param1:String) : _1F_z._1r__
      {
         var _loc2_:_1F_z._1r__ = null;
         var _loc3_:_1F_z._1r__ = null;
         for each(_loc3_ in list)
         {
            if(param1 == _loc3_.value)
            {
               _loc2_ = _loc3_;
            }
         }
         return _loc2_;
      }
      
      public static function _162(param1:int) : _1F_z._1r__
      {
         var _loc2_:_1F_z._1r__ = null;
         var _loc3_:_1F_z._1r__ = null;
         for each(_loc3_ in list)
         {
            if(param1 == _loc3_._V_B_)
            {
               _loc2_ = _loc3_;
            }
         }
         return _loc2_;
      }
   }
}
