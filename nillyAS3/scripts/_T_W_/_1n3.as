package _T_W_
{
   import flash.events.Event;
   
   public class _1n3 extends Event
   {
      
      public static const _vw:String = "preMappingCreate";
      
      public static const _1C_l:String = "postMappingCreate";
      
      public static const _77:String = "preMappingChange";
      
      public static const _1J_D_:String = "postMappingChange";
      
      public static const _0cQ_:String = "postMappingRemove";
      
      public static const _1a4:String = "mappingOverride";
       
      
      public var _0R_6:Class;
      
      public var _9f:String;
      
      public var mapping:_T_W_._1M_q;
      
      public function _1n3(param1:String, param2:Class, param3:String, param4:_T_W_._1M_q)
      {
         super(param1);
         this._0R_6 = param2;
         this._9f = param3;
         this.mapping = param4;
      }
      
      override public function clone() : Event
      {
         return new _1n3(type,this._0R_6,this._9f,this.mapping);
      }
   }
}
