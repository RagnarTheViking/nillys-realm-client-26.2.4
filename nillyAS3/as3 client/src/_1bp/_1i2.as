package _1bp
{
   import _1xa.AppendingLineBuilder;
   import _C_._1O_I_;
   import _1xa._dU_;
   import ToolTips._1l1;
   
   public class _1i2 extends _7J_
   {
       
      
      private var decoy:XMLList;
      
      private var _0qw:XMLList;
      
      public function _1i2()
      {
         super();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         var duration:Number = NaN;
         var otherDuration:Number = NaN;
         var textColor:uint = 0;
         var test:String = null;
         var itemXML:XML = param1;
         var curItemXML:XML = param2;
         this.decoy = itemXML.Activate.(text() == "Decoy");
         this._0qw = curItemXML.Activate.(text() == "Decoy");
         _0N_9 = new AppendingLineBuilder();
         if(this.decoy.length() == 1 && this._0qw.length() == 1)
         {
            duration = Number(this.decoy[0].@duration);
            otherDuration = Number(this._0qw[0].@duration);
            textColor = _0dK_(duration - otherDuration);
            _0N_9.pushParams(_1O_I_._2__,{"data":new _dU_().setParams(_1O_I_._1rK_,{"duration":duration.toString()}).setPrefix(_1l1._07l(textColor)).setPostfix(_1l1._1S_Z_())});
            test = this.decoy[0].toXMLString();
            _1U_C_[this.decoy[0].toXMLString()] = true;
         }
      }
   }
}
