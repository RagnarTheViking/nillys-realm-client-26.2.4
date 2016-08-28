package _1F_z
{
   public class _A_H_
   {
      
      public static const _0F_F_:_1F_z._A_H_ = new _1F_z._A_H_("Yard Upgrader 1",1,_1F_z._1r__._1uO_);
      
      public static const _0D_P_:_1F_z._A_H_ = new _1F_z._A_H_("Yard Upgrader 2",2,_1F_z._1r__._b0);
      
      public static const _0L_s:_1F_z._A_H_ = new _1F_z._A_H_("Yard Upgrader 3",3,_1F_z._1r__._06T_);
      
      public static const _0ux:_1F_z._A_H_ = new _1F_z._A_H_("Yard Upgrader 4",4,_1F_z._1r__._1Z_n);
      
      public static const _01:_1F_z._A_H_ = new _1F_z._A_H_("Yard Upgrader 5",5,_1F_z._1r__._99);
      
      public static const _1C_Y_:int = 5;
       
      
      public var value:String;
      
      public var _V_B_:int;
      
      public var rarity:_1F_z._1r__;
      
      public function _A_H_(param1:*, param2:int, param3:_1F_z._1r__)
      {
         super();
         this.value = param1;
         this._V_B_ = param2;
         this.rarity = param3;
      }
      
      public static function get list() : Array
      {
         return [_0F_F_,_0D_P_,_0L_s,_0ux,_01];
      }
      
      public static function _0Q_J_(param1:String) : _1F_z._A_H_
      {
         var _loc2_:_1F_z._A_H_ = null;
         var _loc3_:_1F_z._A_H_ = null;
         for each(_loc3_ in list)
         {
            if(param1 == _loc3_.value)
            {
               _loc2_ = _loc3_;
            }
         }
         return _loc2_;
      }
      
      public static function _162(param1:int) : _1F_z._A_H_
      {
         var _loc2_:_1F_z._A_H_ = null;
         var _loc3_:_1F_z._A_H_ = null;
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
