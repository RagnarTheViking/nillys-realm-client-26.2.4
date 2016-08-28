package _04m
{
   import _C_._1O_I_;
   
   public class Timespan
   {
      
      public static const _0tf:_04m.Timespan = new _04m.Timespan(_1O_I_._30,"week");
      
      public static const _1V_r:_04m.Timespan = new _04m.Timespan(_1O_I_._C_y,"month");
      
      public static const _1W_I_:_04m.Timespan = new _04m.Timespan(_1O_I_._0T_2,"all");
      
      public static const _1fW_:Vector.<_04m.Timespan> = new <_04m.Timespan>[_0tf,_1V_r,_1W_I_];
       
      
      private var name:String;
      
      private var id:String;
      
      public function Timespan(param1:String, param2:String)
      {
         super();
         this.name = param1;
         this.id = param2;
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function _031() : String
      {
         return this.id;
      }
   }
}
