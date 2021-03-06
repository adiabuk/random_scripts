<?php
/*
  $Id: boxes.php 1739 2007-12-20 00:52:16Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/
  class tableBox {
    var $table_border = '0';
    var $table_width = '100%';
    var $table_cellspacing = '0';
    var $table_cellpadding = '0';
    var $table_parameters = '';
    var $table_row_parameters = '';
    var $table_data_parameters = '';

// class constructor
    function tableBox($contents, $direct_output = false) {
      $tableBox_string = '<table border="' . tep_output_string($this->table_border) . '" width="' . tep_output_string($this->table_width) . '" cellspacing="' . tep_output_string($this->table_cellspacing) . '" cellpadding="' . tep_output_string($this->table_cellpadding) . '"';
      if (tep_not_null($this->table_parameters)) $tableBox_string .= ' ' . $this->table_parameters;
      $tableBox_string .= '>' . "\n";

      for ($i=0, $n=sizeof($contents); $i<$n; $i++) {
        if (isset($contents[$i]['form']) && tep_not_null($contents[$i]['form'])) $tableBox_string .= $contents[$i]['form'] . "\n";
        $tableBox_string .= '  <tr';
        if (tep_not_null($this->table_row_parameters)) $tableBox_string .= ' ' . $this->table_row_parameters;
        if (isset($contents[$i]['params']) && tep_not_null($contents[$i]['params'])) $tableBox_string .= ' ' . $contents[$i]['params'];
        $tableBox_string .= '>' . "\n";

        if (isset($contents[$i][0]) && is_array($contents[$i][0])) {
          for ($x=0, $n2=sizeof($contents[$i]); $x<$n2; $x++) {
            if (isset($contents[$i][$x]['text']) && tep_not_null($contents[$i][$x]['text'])) {
              $tableBox_string .= '    <td';
              if (isset($contents[$i][$x]['align']) && tep_not_null($contents[$i][$x]['align'])) $tableBox_string .= ' align="' . tep_output_string($contents[$i][$x]['align']) . '"';
              if (isset($contents[$i][$x]['params']) && tep_not_null($contents[$i][$x]['params'])) {
                $tableBox_string .= ' ' . $contents[$i][$x]['params'];
              } elseif (tep_not_null($this->table_data_parameters)) {
                $tableBox_string .= ' ' . $this->table_data_parameters;
              }
              $tableBox_string .= '>';
              if (isset($contents[$i][$x]['form']) && tep_not_null($contents[$i][$x]['form'])) $tableBox_string .= $contents[$i][$x]['form'];
              $tableBox_string .= $contents[$i][$x]['text'];
              if (isset($contents[$i][$x]['form']) && tep_not_null($contents[$i][$x]['form'])) $tableBox_string .= '</form>';
              $tableBox_string .= '</td>' . "\n";
            }
          }
        } else {
          $tableBox_string .= '    <td';
          if (isset($contents[$i]['align']) && tep_not_null($contents[$i]['align'])) $tableBox_string .= ' align="' . tep_output_string($contents[$i]['align']) . '"';
          if (isset($contents[$i]['params']) && tep_not_null($contents[$i]['params'])) {
            $tableBox_string .= ' ' . $contents[$i]['params'];
          } elseif (tep_not_null($this->table_data_parameters)) {
            $tableBox_string .= ' ' . $this->table_data_parameters;
          }
          $tableBox_string .= '>' . $contents[$i]['text'] . '</td>' . "\n";
        }

        $tableBox_string .= '  </tr>' . "\n";
        if (isset($contents[$i]['form']) && tep_not_null($contents[$i]['form'])) $tableBox_string .= '</form>' . "\n";
      }

      $tableBox_string .= '</table>' . "\n";

      if ($direct_output == true) echo $tableBox_string;

      return $tableBox_string;
    }
  }  
// **********************************************************************************************
// ************************ class infoBoxHeading  
  class infoBoxHeading extends tableBox {
    function infoBoxHeading($contents, $left_corner = true, $right_corner = true, $right_arrow = false) {
      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="infoBoxHeading_table"';	  

      if ($left_corner == true) {
        $left_corner = tep_image(DIR_WS_IMAGES . 'corner_top_left.gif');
      } else {
        $left_corner = tep_image(DIR_WS_IMAGES . 'corner_top_left.gif');
      }
      if ($right_arrow == true) {
        $right_arrow = '';
      } else {
        $right_arrow = '';
      }
      if ($right_corner == false) {
        $right_corner = $right_arrow . tep_image(DIR_WS_IMAGES . 'corner_top_right.gif');
      } else {
        $right_corner = $right_arrow . tep_image(DIR_WS_IMAGES . 'corner_top_right.gif');
      }
      $info_box_contents = array();
      $info_box_contents[] = array(array('params' => '',
                                         	'text' => $left_corner),
									(array(	'params' => ' class="infoBoxHeading_t"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').'')),
									(array(	'params' => '',
                                         	'text' => $right_corner)));
	  
      $info_box_contents[] = array(array('params' => ' class="infoBoxHeading_l"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').''),
									(array(	'params' => ' class="infoBoxHeading_td"',
                                         	'text' => ''.$contents[0]['text'].'')),
									(array(	'params' => ' class="infoBoxHeading_r"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').'')));
      $this->tableBox($info_box_contents, true);
    }
  }
// ********************************************************************************************** 
// ************************ class infoBox  
  class infoBox extends tableBox {
    function infoBox($contents) {
      $info_box_contents = array();
      $info_box_contents[] = array('text' => $this->infoBoxContents($contents));
      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="infoBox_table"';
      $this->table_data_parameters = ' class="infoBox_td"';	  
      $this->tableBox($info_box_contents, true);
    }

    function infoBoxContents($contents) {
      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="infoBoxContents_table"';
      $info_box_contents = array();
      for ($i=0, $n=sizeof($contents); $i<$n; $i++) {
      $info_box_contents[] = array(array('align' => (isset($contents[$i]['align']) ? $contents[$i]['align'] : ''),
										 'form' => (isset($contents[$i]['form']) ? $contents[$i]['form'] : ''),
										 'params' => ' class="boxText"',
                                         'text' => '
		<table cellpadding="0" cellspacing="0" border="0" class="table">
			<tr><td class="td">'.(isset($contents[$i]['text']) ? $contents[$i]['text'] : '').'</td></tr>
		</table>
	')); 
		}
      return $this->tableBox($info_box_contents);
    }
  }
// **********************************************************************************************
// **********************************************************************************************     
// ************************ class infoBoxHeading2  
  class infoBoxHeading2 extends tableBox {
    function infoBoxHeading2($contents, $left_corner = true, $right_corner = true, $right_arrow = false) {
      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="infoBoxHeading2_table"';	  

      if ($left_corner == true) {
        $left_corner = tep_image(DIR_WS_IMAGES . 'corner_top_left.gif');
      } else {
        $left_corner = tep_image(DIR_WS_IMAGES . 'corner_top_left.gif');
      }
      if ($right_arrow == true) {
        $right_arrow = '';
      } else {
        $right_arrow = '';
      }
      if ($right_corner == false) {
        $right_corner = $right_arrow . tep_image(DIR_WS_IMAGES . 'corner_top_right.gif');
      } else {
        $right_corner = $right_arrow . tep_image(DIR_WS_IMAGES . 'corner_top_right.gif');
      }
      $info_box_contents = array();
      $info_box_contents[] = array(array('params' => '',
                                         	'text' => $left_corner),
									(array(	'params' => ' class="infoBoxHeading_t"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').'')),
									(array(	'params' => '',
                                         	'text' => $right_corner)));
	  
      $info_box_contents[] = array(array('params' => ' class="infoBoxHeading_l"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').''),
									(array(	'params' => ' class="infoBoxHeading2_td"',
                                         	'text' => ''.$contents[0]['text'].'')),
									(array(	'params' => ' class="infoBoxHeading_r"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').'')));
      $this->tableBox($info_box_contents, true);
    }
  }
// ********************************************************************************************** 
// ************************ class infoBox2 
  class infoBox2 extends tableBox {
    function infoBox2($contents) {
      $info_box_contents = array();
      $info_box_contents[] = array('text' => $this->infoBoxContents($contents));
      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="infoBox2_table"';
      $this->table_data_parameters = ' class="infoBox2_td"';	  
      $this->tableBox($info_box_contents, true);
    }

    function infoBoxContents($contents) {
      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="infoBoxContents2_table"';
      $info_box_contents = array();
      for ($i=0, $n=sizeof($contents); $i<$n; $i++) {
      $info_box_contents[] = array(array('align' => (isset($contents[$i]['align']) ? $contents[$i]['align'] : ''),
										 'form' => (isset($contents[$i]['form']) ? $contents[$i]['form'] : ''),
										 'params' => ' class="boxText"',
                                         'text' => '
		<table cellpadding="0" cellspacing="0" border="0" class="table">
			<tr><td class="td">'.(isset($contents[$i]['text']) ? $contents[$i]['text'] : '').'</td></tr>
		</table>
	')); 
		}
      return $this->tableBox($info_box_contents);
    }
  }
// **********************************************************************************************
// ************************ class infoBoxHeading3  
  class infoBoxHeading3 extends tableBox {
    function infoBoxHeading3($contents, $left_corner = true, $right_corner = true, $right_arrow = false) {
      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="infoBoxHeading3_table"';	  

      if ($left_corner == true) {
        $left_corner = tep_image(DIR_WS_IMAGES . 'corner_top_left.gif');
      } else {
        $left_corner = tep_image(DIR_WS_IMAGES . 'corner_top_left.gif');
      }
      if ($right_arrow == true) {
        $right_arrow = '';
      } else {
        $right_arrow = '';
      }
      if ($right_corner == false) {
        $right_corner = $right_arrow . tep_image(DIR_WS_IMAGES . 'corner_top_right.gif');
      } else {
        $right_corner = $right_arrow . tep_image(DIR_WS_IMAGES . 'corner_top_right.gif');
      }
      $info_box_contents = array();
      $info_box_contents[] = array(array('params' => '',
                                         	'text' => $left_corner),
									(array(	'params' => ' class="infoBoxHeading_t"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').'')),
									(array(	'params' => '',
                                         	'text' => $right_corner)));
	  
      $info_box_contents[] = array(array('params' => ' class="infoBoxHeading_l"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').''),
									(array(	'params' => ' class="infoBoxHeading3_td"',
                                         	'text' => ''.$contents[0]['text'].'')),
									(array(	'params' => ' class="infoBoxHeading_r"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').'')));
      $this->tableBox($info_box_contents, true);
    }
  }
// ********************************************************************************************** 
// ************************ class infoBox3  
  class infoBox3 extends tableBox {
    function infoBox3($contents) {
      $info_box_contents = array();
      $info_box_contents[] = array('text' => $this->infoBoxContents($contents));
      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="infoBox3_table"';
      $this->table_data_parameters = ' class="infoBox3_td"';	  
      $this->tableBox($info_box_contents, true);
    }

    function infoBoxContents($contents) {
      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="infoBoxContents3_table"';
      $info_box_contents = array();
      for ($i=0, $n=sizeof($contents); $i<$n; $i++) {
      $info_box_contents[] = array(array('align' => (isset($contents[$i]['align']) ? $contents[$i]['align'] : ''),
										 'form' => (isset($contents[$i]['form']) ? $contents[$i]['form'] : ''),
										 'params' => ' class="boxText"',
                                         'text' => '
		<table cellpadding="0" cellspacing="0" border="0" class="table">
			<tr><td class="td"><div class="div">'.(isset($contents[$i]['text']) ? $contents[$i]['text'] : '').'</div></td></tr>
		</table>
	')); 
		}
      return $this->tableBox($info_box_contents);
    }
  }
// **********************************************************************************************
// **********************************************************************************************   
// **********************************************************************************************   
// **********************************************************************************************
// ************************ class infoBoxHeading7  
  class infoBoxHeading7 extends tableBox {
    function infoBoxHeading7($contents, $left_corner = true, $right_corner = true, $right_arrow = false) {
      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="infoBoxHeading7_table"';	  

      if ($left_corner == true) {
        $left_corner = tep_image(DIR_WS_IMAGES . 'corner_top_left.gif');
      } else {
        $left_corner = tep_image(DIR_WS_IMAGES . 'corner_top_left.gif');
      }
      if ($right_arrow == true) {
        $right_arrow = '';
      } else {
        $right_arrow = '';
      }
      if ($right_corner == false) {
        $right_corner = $right_arrow . tep_image(DIR_WS_IMAGES . 'corner_top_right.gif');
      } else {
        $right_corner = $right_arrow . tep_image(DIR_WS_IMAGES . 'corner_top_right.gif');
      }
      $info_box_contents = array();
      $info_box_contents[] = array(array('params' => ' class="infoBoxHeading7_td"',
                                         	'text' => ''.$contents[0]['text'].''));
      $this->tableBox($info_box_contents, true);
    }
  }
// **********************************************************************************************   
// ************************ class infoBox7  
  class infoBox7 extends tableBox {
    function infoBox7($contents) {
      $info_box_contents = array();
      $info_box_contents[] = array('text' => $this->infoBoxContents($contents));
      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="infoBox7_table"';
      $this->table_data_parameters = ' class="infoBox7_td"';	  
      $this->tableBox($info_box_contents, true);
    }

    function infoBoxContents($contents) {
      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="infoBoxContents7_table"';
      $info_box_contents = array();
      for ($i=0, $n=sizeof($contents); $i<$n; $i++) {	  
      $info_box_contents[] = array(array('align' => (isset($contents[$i]['align']) ? $contents[$i]['align'] : ''),
										 	'form' => (isset($contents[$i]['form']) ? $contents[$i]['form'] : ''),
										 	'params' => ' class="boxText"',
                                         	'text' => ''.(isset($contents[$i]['text']) ? $contents[$i]['text'] : '').''));												  
	}
	return $this->tableBox($info_box_contents);
    }
  }
// **********************************************************************************************     
// ************************ class errorBox  
  class errorBox extends tableBox {
    function errorBox($contents) {
      $this->table_data_parameters = 'class="errorBox"';
      $this->tableBox($contents, true);
    }
  }
// **********************************************************************************************
// ************************ class tableBox_output
 class tableBox_output {
    var $table_border = '0';
    var $table_width = '';
    var $table_cellspacing = '0';
    var $table_cellpadding = '0';
    var $table_parameters = ' ';
    var $table_row_parameters = '';
    var $table_data_parameters = '';

// class constructor
    function tableBox_output($contents, $direct_output = false) {
      $tableBox_string = '<table border="' . tep_output_string($this->table_border) . '" width="' . tep_output_string($this->table_width) . '" cellspacing="' . tep_output_string($this->table_cellspacing) . '" cellpadding="' . tep_output_string($this->table_cellpadding) . '"';
      if (tep_not_null($this->table_parameters)) $tableBox_string .= '' . $this->table_parameters;
      $tableBox_string .= '>' . "\n";
      for ($i=0, $n=sizeof($contents); $i<$n; $i++) {
        if (isset($contents[$i]['form']) && tep_not_null($contents[$i]['form'])) $tableBox_string .= $contents[$i]['form'] . "\n";
		if ($i != 0) 
		{ 
		$tableBox_string.='<tr><td class="prod_line_x padd_gg" colspan="'.(($x+$x)-1).'">'.tep_draw_separator('spacer.gif', '1', '1').'</td></tr>';
		} 
		$tableBox_string .= '   <tr';
        if (tep_not_null($this->table_row_parameters)) $tableBox_string .= ' ' . $this->table_row_parameters;
        if (isset($contents[$i]['params']) && tep_not_null($contents[$i]['params'])) $tableBox_string .= ' ' . $contents[$i]['params'];
        $tableBox_string .= '>' . "\n";
        if (isset($contents[$i][0]) && is_array($contents[$i][0])) {
          for ($x=0, $n2=sizeof($contents[$i]); $x<$n2; $x++) {
            if (isset($contents[$i][$x]['text']) && tep_not_null($contents[$i][$x]['text'])) {
				if ($x >= 1){
					if($i == 0) {
					$tableBox_string .= '<td class="prod_line_y padd_vv">'.tep_draw_separator('spacer.gif', '1', '1').'</td>';
					}else{ 
					$tableBox_string .= '<td class="prod_line_y padd_vv">'.tep_draw_separator('spacer.gif', '1', '1').'</td>';} 
					}
			  $tableBox_string .= '    <td';
              if (isset($contents[$i][$x]['align']) && tep_not_null($contents[$i][$x]['align'])) $tableBox_string .= ' align="' . tep_output_string($contents[$i][$x]['align']) . '"';
              if (isset($contents[$i][$x]['params']) && tep_not_null($contents[$i][$x]['params'])) {
                $tableBox_string .= ' ' . $contents[$i][$x]['params'];
              } elseif (tep_not_null($this->table_data_parameters)) {
                $tableBox_string .= ' ' . $this->table_data_parameters;
              }
			  if ($i >= 1)	{
              $tableBox_string .= '>'.tep_draw_separator('spacer.gif', '1', '4').'<br>';	
			  }else{
			  $tableBox_string .= '>';
			  }
              if (isset($contents[$i][$x]['form']) && tep_not_null($contents[$i][$x]['form'])) $tableBox_string .= $contents[$i][$x]['form'];
			  $tableBox_string .= $contents[$i][$x]['text'];
              if (isset($contents[$i][$x]['form']) && tep_not_null($contents[$i][$x]['form'])) $tableBox_string .= '</form>';
              $tableBox_string .= '</td>  ' . "\n";
            }
          }
        } else {
        $tableBox_string .= '    <td';
        if (isset($contents[$i]['align']) && tep_not_null($contents[$i]['align'])) $tableBox_string .= ' align="' . tep_output_string($contents[$i]['align']) . '"';
        if (isset($contents[$i]['params']) && tep_not_null($contents[$i]['params'])) {
        $tableBox_string .= ' ' . $contents[$i]['params'];
        } elseif (tep_not_null($this->table_data_parameters)) {
          $tableBox_string .= ' ' . $this->table_data_parameters;
          }
          $tableBox_string .= '>' . $contents[$i]['text'] . '</td>' . "\n";
        }
        $tableBox_string .= '  </tr> 	' . "\n";
        if (isset($contents[$i]['form']) && tep_not_null($contents[$i]['form'])) $tableBox_string .= '</form>' . "\n";
      }
      $tableBox_string .= '</table>' . "\n";
      if ($direct_output == true) echo $tableBox_string;
      return $tableBox_string;
    }
  }
// **********************************************************************************************
// **********************************************************************************************
// ************************ class tableBox_output
  class contentBox extends tableBox_output {
    function contentBox($contents) {
      $info_box_contents = array();
      $info_box_contents[] = array('text' => $this->contentBoxContents($contents));
      $this->table_cellpadding = '0';
      $this->table_parameters = '';
      $this->table_data_parameters = ' class="tableBox_output_td main"';	  
      $this->tableBox_output($info_box_contents, true);
    }

    function contentBoxContents($contents) {
      $this->table_cellpadding = '0';
      $this->table_parameters = '';
      return $this->tableBox_output($contents);
    }
  }
// **********************************************************************************************
// **********************************************************************************************
// ******************************** contentBoxHeading *******************************************
  class contentBoxHeading extends tableBox {
    function contentBoxHeading($contents) {
	

      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="cont_heading_table"';	  

      $info_box_contents = array();
      $info_box_contents[] = array(array('params' => '',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_top_left.gif').''),
									(array(	'params' => ' class="cont_heading_t"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').'')),
									(array(	'params' => '',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_top_right.gif').'')));
      $info_box_contents[] = array(array('params' => ' class="cont_heading_l"',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_c_left.gif').''),
									(array(	'params' => ' class="cont_heading_td"',
                                         	'text' => ''.$contents[0]['text'].'')),
									(array(	'params' => ' class="cont_heading_r"',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_bottom_right.gif').'')));
      $info_box_contents[] = array(array('params' => '',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_bottom_left.gif').''),
									(array(	'params' => ' class="cont_heading_b"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').'')),
									(array(	'params' => '',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_bottom_right.gif').'')));											
      $this->tableBox($info_box_contents, true);
    }
  }

// ************************************ contentBoxHeading_WHATS_NEW *****************************
  class contentBoxHeading_WHATS_NEW extends tableBox {
    function contentBoxHeading_WHATS_NEW($contents) {
	

      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="cont_heading_table"';	  

      $info_box_contents = array();
      $info_box_contents[] = array(array('params' => '',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_top_left.gif').''),
									(array(	'params' => ' class="cont_heading_t"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').'')),
									(array(	'params' => '',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_top_right.gif').'')));
      $info_box_contents[] = array(array('params' => ' class="cont_heading_l"',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_c_left.gif').''),
									(array(	'params' => ' class="cont_heading_td"',
                                         	'text' => ''.BOX_HEADING_WHATS_NEW.'')),
									(array(	'params' => ' class="cont_heading_r"',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_c_right.gif').'')));
      $info_box_contents[] = array(array('params' => '',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_bottom_left.gif').''),
									(array(	'params' => ' class="cont_heading_b"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').'')),
									(array(	'params' => '',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_bottom_right.gif').'')));											
      $this->tableBox($info_box_contents, true);
    }
  }
// **************************************** contentBoxHeading_ProdNew *************************** 
  class contentBoxHeading_ProdNew extends tableBox {
    function contentBoxHeading_ProdNew($contents) {

      $this->table_cellpadding = '0';
      $this->table_parameters = ' class="cont_heading_table"';	  

      $info_box_contents = array();
      $info_box_contents[] = array(array('params' => '',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_top_left.gif').''),
									(array(	'params' => ' class="cont_heading_t"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').'')),
									(array(	'params' => '',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_top_right.gif').'')));
      $info_box_contents[] = array(array('params' => ' class="cont_heading_l"',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_c_left.gif').''),
									(array(	'params' => ' class="cont_heading_td"',
                                         	'text' => ''.HEADING_TITLE.'')),
									(array(	'params' => ' class="cont_heading_r"',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_c_right.gif').'')));
      $info_box_contents[] = array(array('params' => '',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_bottom_left.gif').''),
									(array(	'params' => ' class="cont_heading_b"',
                                         	'text' => ''.tep_draw_separator('spacer.gif', '1', '1').'')),
									(array(	'params' => '',
                                         	'text' => ''.tep_image(DIR_WS_IMAGES.'cont_heading_bottom_right.gif').'')));											
      $this->tableBox($info_box_contents, true);
    }
  }
// **********************************************************************************************
  function tep_draw_title_top()
  {
  return $table = '
  				<table cellpadding="0" cellspacing="0" border="0" class="cont_heading_table">
					<tr>
						<td>'.tep_image(DIR_WS_IMAGES.'cont_heading_top_left.gif').'</td>
						<td class="cont_heading_t">'.tep_draw_separator('spacer.gif', '1', '1').'</td>
						<td>'.tep_image(DIR_WS_IMAGES.'cont_heading_top_right.gif').'</td>
					</tr>
					<tr>
						<td class="cont_heading_l">'.tep_image(DIR_WS_IMAGES.'cont_heading_c_left.gif').'</td>
						<td class="cont_heading_td">';
  }
// **********************************************************************************************
  function  tep_draw_title_bottom()
  {
   return $table =  '</td>
						<td class="cont_heading_r">'.tep_image(DIR_WS_IMAGES.'cont_heading_c_right.gif').'</td>
					</tr>
					<tr>
						<td>'.tep_image(DIR_WS_IMAGES.'cont_heading_bottom_left.gif').'</td>
						<td class="cont_heading_b">'.tep_draw_separator('spacer.gif', '1', '1').'</td>
						<td>'.tep_image(DIR_WS_IMAGES.'cont_heading_bottom_right.gif').'</td>
					</tr>
				</table>';
  }
// **********************************************************************************************  
// **********************************************************************************************
// ************************ class tableBox_shopping_cart 
class tableBox_shopping_cart {
    var $table_border = '0';
    var $table_width = '';
    var $table_cellspacing = '0';
    var $table_cellpadding = '0';
    var $table_parameters = '';
    var $table_row_parameters = '';
    var $table_data_parameters = '';

// class constructor
    function tableBox_shopping_cart($contents, $direct_output = false) {
      $tableBox_string = '<table border="' . tep_output_string($this->table_border) . '" width="' . tep_output_string($this->table_width) . '" cellspacing="' . tep_output_string($this->table_cellspacing) . '" cellpadding="' . tep_output_string($this->table_cellpadding) . '"';
      if (tep_not_null($this->table_parameters)) $tableBox_string .= ' ' . $this->table_parameters;
      $tableBox_string .= '>' . "\n";
      for ($i=0, $n=sizeof($contents); $i<$n; $i++) {
        if (isset($contents[$i]['form']) && tep_not_null($contents[$i]['form'])) $tableBox_string .= $contents[$i]['form'] . "\n";
		if ($i != 0) 
		{ 
		$tableBox_string.='<tr><td class="cart_line_x padd2_gg" colspan="'.(($x+$x)-1).'">'.tep_draw_separator('spacer.gif', '1', '1').'</td></tr>';
		} 
		$tableBox_string .= '   <tr';
        if (tep_not_null($this->table_row_parameters)) $tableBox_string .= ' ' . $this->table_row_parameters;
        if (isset($contents[$i]['params']) && tep_not_null($contents[$i]['params'])) $tableBox_string .= ' ' . $contents[$i]['params'];
        $tableBox_string .= '>' . "\n";
        if (isset($contents[$i][0]) && is_array($contents[$i][0])) {
          for ($x=0, $n2=sizeof($contents[$i]); $x<$n2; $x++) {
            if (isset($contents[$i][$x]['text']) && tep_not_null($contents[$i][$x]['text'])) {
				if ($x >= 1){
					if($i == 0) {
					$tableBox_string .= '<td class="cart_line_y padd2_vv">'.tep_draw_separator('spacer.gif', '1', '1').'</td>';
					}else{ 
					$tableBox_string .= '<td class="cart_line_y padd2_vv">'.tep_draw_separator('spacer.gif', '1', '1').'</td>';} 
					}
			  $tableBox_string .= '    <td';
              if (isset($contents[$i][$x]['align']) && tep_not_null($contents[$i][$x]['align'])) $tableBox_string .= ' align="' . tep_output_string($contents[$i][$x]['align']) . '"';
              if (isset($contents[$i][$x]['params']) && tep_not_null($contents[$i][$x]['params'])) {
                $tableBox_string .= ' ' . $contents[$i][$x]['params'];
              } elseif (tep_not_null($this->table_data_parameters)) {
                $tableBox_string .= ' ' . $this->table_data_parameters;
              }
			  if ($i >= 1)	{
              $tableBox_string .= '>';
			  }else{
			  $tableBox_string .= '>';
			  }
              if (isset($contents[$i][$x]['form']) && tep_not_null($contents[$i][$x]['form'])) $tableBox_string .= $contents[$i][$x]['form'];
			  $tableBox_string .= $contents[$i][$x]['text'];
              if (isset($contents[$i][$x]['form']) && tep_not_null($contents[$i][$x]['form'])) $tableBox_string .= '</form>';
              $tableBox_string .= '</td>  ' . "\n";
            }
          }
        } else {
          $tableBox_string .= '    <td';
          if (isset($contents[$i]['align']) && tep_not_null($contents[$i]['align'])) $tableBox_string .= ' align="' . tep_output_string($contents[$i]['align']) . '"';
          if (isset($contents[$i]['params']) && tep_not_null($contents[$i]['params'])) {
            $tableBox_string .= ' ' . $contents[$i]['params'];
          } elseif (tep_not_null($this->table_data_parameters)) {
            $tableBox_string .= ' ' . $this->table_data_parameters;
          }
          $tableBox_string .= '>' /* .tep_draw_shop_top_1() */  . $contents[$i]['text'] .  /* tep_draw_shop_bottom_1(). */ '</td>' . "\n";
        }

        $tableBox_string .= '  </tr>' . "\n";
		
/*  if ($i >= 2) {  */
 $tableBox_string .= '
										 
 ';
 /*  }  */		
		
        if (isset($contents[$i]['form']) && tep_not_null($contents[$i]['form'])) $tableBox_string .= '</form>' . "\n";
      }

      $tableBox_string .= '</table>' . "\n";

      if ($direct_output == true) echo $tableBox_string;

      return $tableBox_string;
    }
  }
  class productListingBox extends tableBox_shopping_cart {
    function productListingBox($contents) {
      $this->table_parameters = 'class="tableBox_shopping_cart main"';
      $this->tableBox_shopping_cart($contents, true);
    }
  }
 
// **********************************************************************************************
// **********************************************************************************************
// **********************************************************************************************
  function  tep_separat()
  { return $table = '<div style="padding:9px 0px 0px 0px;">'.tep_draw_separator('spacer.gif', '1', '1').'</div>';}
// **********************************************************************************************
  function  tep_separat2()
  { return $table = '<div style="padding:5px 0px 0px 0px;">'.tep_draw_separator('spacer.gif', '1', '1').'</div>';}
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw_top()
  {
  return $table = '';}
// **********************************************************************************************
  function  tep_draw_bottom()
  { return $table = '';}
// **********************************************************************************************
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw1_top()
  { return $table = '
  <table cellpadding="0" cellspacing="0" border="0" class="content_wrapper_table">
  		<tr><td class="content_wrapper_td padd_1">';}
// **********************************************************************************************
  function  tep_draw1_bottom()
  { return $table = '</td></tr>
  </table>';}
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw2_top()
  {
  return $table = '<table cellpadding="0" cellspacing="0" border="0"><tr><td class="padd_2">';
  }
// **********************************************************************************************
  function  tep_draw2_bottom()
  {
   return $table = '</td></tr></table>';
  }
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw4_top()
  { return $table = '
  <table cellpadding="0" cellspacing="0" border="0" class="content_wrapper_table">
  		<tr><td class="content_wrapper_td padd_4">';}
// **********************************************************************************************
  function  tep_draw4_bottom()
  { return $table = '</td></tr>
  </table>';}
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw3_top()
  { return $table = '
  <table cellpadding="0" cellspacing="0" border="0" class="content_wrapper_table">
  		<tr><td class="content_wrapper_td padd_3">';}
// **********************************************************************************************
  function  tep_draw3_bottom()
  { return $table = '</td></tr>
  </table>';}
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw5_top()
  { return $table = '
  <table cellpadding="0" cellspacing="0" border="0" class="table"><tr><td class="padd_5">';}
// **********************************************************************************************
  function  tep_draw5_bottom()
  { return $table = '</td></tr></table>';}
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw_prod_pic2_top()
  {
  return $table = '
  <table cellpadding="0" cellspacing="0" border="0" align="center" class="pic_table">
  		<tr>
			<td>'.tep_image(DIR_WS_IMAGES.'pic_tl.gif').'</td>
			<td class="pic_t">'.tep_draw_separator('spacer.gif', '1', '1').'</td>
			<td>'.tep_image(DIR_WS_IMAGES.'pic_tr.gif').'</td>
		</tr>
  		<tr>
			<td class="pic_l">'.tep_draw_separator('spacer.gif', '1', '1').'</td>
			<td class="pic_td">';
  }
// **********************************************************************************************
  function  tep_draw_prod_pic2_bottom()
  {
   return $table = '</td>
			<td class="pic_r">'.tep_draw_separator('spacer.gif', '1', '1').'</td>
		</tr>
  		<tr>
			<td>'.tep_image(DIR_WS_IMAGES.'pic_bl.gif').'</td>
			<td class="pic_b">'.tep_draw_separator('spacer.gif', '1', '1').'</td>
			<td>'.tep_image(DIR_WS_IMAGES.'pic_br.gif').'</td>
		</tr>
  </table>';
  }
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw_prod_pic_top()
  {
  return $table = '
  <table cellpadding="0" cellspacing="0" border="0" align="center" class="pic_table">
  		<tr>
			<td>'.tep_image(DIR_WS_IMAGES.'pic_tl.gif').'</td>
			<td class="pic_t">'.tep_draw_separator('spacer.gif', '1', '1').'</td>
			<td>'.tep_image(DIR_WS_IMAGES.'pic_tr.gif').'</td>
		</tr>
  		<tr>
			<td class="pic_l">'.tep_draw_separator('spacer.gif', '1', '1').'</td>
			<td class="pic_td">';
  }
// **********************************************************************************************
  function  tep_draw_prod_pic_bottom()
  {
   return $table = '</td>
			<td class="pic_r">'.tep_draw_separator('spacer.gif', '1', '1').'</td>
		</tr>
  		<tr>
			<td>'.tep_image(DIR_WS_IMAGES.'pic_bl.gif').'</td>
			<td class="pic_b">'.tep_draw_separator('spacer.gif', '1', '1').'</td>
			<td>'.tep_image(DIR_WS_IMAGES.'pic_br.gif').'</td>
		</tr>
  </table>';
  }
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw_prod_top()
  {
  return $table = '
  <table cellpadding="0" cellspacing="0" border="0" class="prod_table">
  		<tr><td class="prod_td">';
  }
// **********************************************************************************************
  function  tep_draw_prod_bottom()
  {
   return $table = '</td></tr>
  </table>';
  }
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw_prod2_top()
  {
//  return $table = '<table cellpadding="0" cellspacing="0" border="0" class="prod2_table"><tr><td class="prod2_td">';
  return $table = '
  <table cellpadding="0" cellspacing="0" border="0" class="prod2_table1">
  		<tr>
			<td class="prod2_td1">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="6"><img src="images/STYLE-tl.png"></td>
					<td style="background:url(images/STYLE-t.png) no-x;"></td>
					<td width="6"><img src="images/STYLE-tr.png"></td>
				  </tr>
				  <tr>
					<td></td>
					<td>
	';
  }
// **********************************************************************************************
  function  tep_draw_prod2_bottom()
  {
   return $table = '
					</td>
					<td></td>
				  </tr>
				  <tr>
					<td></td>
					<td></td>
					<td></td>
				  </tr>
				</table>   
		   </td></tr>
		  </table>';
  }
// **********************************************************************************************
// **********************************************************************************************
  function  panel_top(){ require(DIR_WS_BOXES . 'panel_top.php');}
// **********************************************************************************************
  function  tep_draw_price_top()
  {
  return $table = ''; }
// **********************************************************************************************
  function  tep_draw_price_bottom()
  {
   return $table = '';}
// **********************************************************************************************
// **********************************************************************************************
  function  tep_pixel_trans()
  { return $table = '<div style="padding:0px 0px 4px 0px;">'.tep_draw_separator('spacer.gif', '1', '1').'</div>';}
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw_side_top()
  { return $table = '';}
// **********************************************************************************************
  function  tep_draw_side_bottom()
  { return $table = '';}
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw_column_top()
  { return $table = '
  					<tr><td>'.tep_draw_separator('spacer.gif', '1', '9').'</td></tr>
					<tr><td class="box_wrapper_t">
						<table cellpadding="0" cellspacing="0" border="0" class="box_wrapper_r">
							<tr><td class="box_wrapper_b">
								<table cellpadding="0" cellspacing="0" border="0" class="box_wrapper_l">
									<tr><td class="box_wrapper_tr">
										<table cellpadding="0" cellspacing="0" border="0" class="box_wrapper_tl">
											<tr><td class="box_wrapper_tr">
												<table cellpadding="0" cellspacing="0" border="0" class="box_wrapper_bl">
													<tr><td class="box_wrapper_br">
														<table cellpadding="0" cellspacing="0" border="0">';}
// **********************************************************************************************
  function  tep_draw_column_bottom()
  { return $table = '</table>
  													</td></tr>
  												</table>
											</td></tr>
										</table>
									</td></tr>
								</table>
							</td></tr>
						</table>
					</td></tr>
					<tr><td>'.tep_draw_separator('spacer.gif', '1', '10').'</td></tr>';}
// **********************************************************************************************
// **********************************************************************************************
  function tep_draw_result1_top()
  {
   return $table = '<div style="background:url(images/line_.gif) 0px 0px repeat-x;">'.tep_draw_separator('spacer.gif', '1', '1').'</div>';
  }
// **********************************************************************************************
function tep_draw_result1_bottom()
	{
   return $table = '<div style="background:url(images/line_x.gif) 0px 0px repeat-x;padding:0px 0px 1px 0px;">'.tep_draw_separator('spacer.gif', '1', '1').'</div>';
  }
// **********************************************************************************************
// **********************************************************************************************
  function tep_draw_result2_top()
  {
   return $table = '<div style="background:url(images/line_x.gif) 0px 100% repeat-x;padding:1px 0px 0px 0px;">'.tep_draw_separator('spacer.gif', '1', '1').'</div>';
  }
// **********************************************************************************************
function tep_draw_result2_bottom()
	{
   return $table = '<div style="background:url(images/line_.gif) 0px 0px repeat-x;padding:0px 0px 0px 0px;">'.tep_draw_separator('spacer.gif', '1', '1').'</div>';
  }
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw_infoBox_top()
  {
  return $table = '
  		<table cellpadding="0" cellspacing="0" border="0" class="infoBox_">
			<tr><td class="pic_td">';
  }
// **********************************************************************************************
  function  tep_draw_infoBox_bottom()
  {
   return $table = '</td></tr>
		</table>';
  }
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw_infoBox2_top()
  {
  return $table = '<table cellpadding="0" cellspacing="5" border="0"><tr><td>';
  }
// **********************************************************************************************
  function  tep_draw_infoBox2_bottom()
  {
   return $table = '</td></tr></table>';
  }
// **********************************************************************************************
// **********************************************************************************************
  function  tep_draw_popup_top()
  { return $table = '
  				<div class="popup_t">
					<div class="popup_r">
						<div class="popup_b">
							<div class="popup_l">
								<div class="popup_tl">
									<div class="popup_tr">
										<div class="popup_bl">
											<div class="popup_br">
												<div class="width_100">';}
// **********************************************************************************************
  function  tep_draw_popup_bottom()
  { return $table = '</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>';}
// **********************************************************************************************

// ************************ class infoBox_search_criteria  
  class infoBox_search_criteria extends tableBox {
    function infoBox_search_criteria($contents) {
      $info_box_contents = array();
      $info_box_contents[] = array('text' => $this->infoBoxContents($contents));
      $this->table_cellpadding = '0';
      $this->table_parameters = '';
      $this->tableBox($info_box_contents, true);
    }

    function infoBoxContents($contents) {
      $this->table_cellpadding = '3';
      $this->table_parameters = '';
      $info_box_contents = array();
      for ($i=0, $n=sizeof($contents); $i<$n; $i++) {
        $info_box_contents[] = array(array('align' => (isset($contents[$i]['align']) ? $contents[$i]['align'] : ''),
                                           'form' => (isset($contents[$i]['form']) ? $contents[$i]['form'] : ''),
                                           'params' => ' class="main" style="padding:0px 10px 0px 10px;"',
                                           'text' => (isset($contents[$i]['text']) ? $contents[$i]['text'] : '')));
      }
      return $this->tableBox($info_box_contents);
    }
  }
// **********************************************************************************************
// **********************************************************************************************


// **********************************************************************************************
// **********************************************************************************************
// **********************************************************************************************
// ************************ class tableBox_output1
 class tableBox_output1 {
    var $table_border = '0';
    var $table_width = '';
    var $table_cellspacing = '0';
    var $table_cellpadding = '0';
    var $table_parameters = ' ';
    var $table_row_parameters = '';
    var $table_data_parameters = '';

// class constructor
    function tableBox_output1($contents, $direct_output = false) {
      $tableBox_string = '<table border="' . tep_output_string($this->table_border) . '" width="' . tep_output_string($this->table_width) . '" cellspacing="' . tep_output_string($this->table_cellspacing) . '" cellpadding="' . tep_output_string($this->table_cellpadding) . '"';
      if (tep_not_null($this->table_parameters)) $tableBox_string .= '' . $this->table_parameters;
      $tableBox_string .= '>' . "\n";
      for ($i=0, $n=sizeof($contents); $i<$n; $i++) {
        if (isset($contents[$i]['form']) && tep_not_null($contents[$i]['form'])) $tableBox_string .= $contents[$i]['form'] . "\n";
		if ($i != 0) 
		{ 
		$tableBox_string.='<tr><td class="prod_line_x padd_gg" colspan="'.(($x+$x)-1).'">'.tep_draw_separator('spacer.gif', '1', '1').'</td></tr>';
		} 
		$tableBox_string .= '   <tr';
        if (tep_not_null($this->table_row_parameters)) $tableBox_string .= ' ' . $this->table_row_parameters;
        if (isset($contents[$i]['params']) && tep_not_null($contents[$i]['params'])) $tableBox_string .= ' ' . $contents[$i]['params'];
        $tableBox_string .= '>' . "\n";
        if (isset($contents[$i][0]) && is_array($contents[$i][0])) {
          for ($x=0, $n2=sizeof($contents[$i]); $x<$n2; $x++) {
            if (isset($contents[$i][$x]['text']) && tep_not_null($contents[$i][$x]['text'])) {
				if ($x >= 1){
					if($i == 0) {
					$tableBox_string .= '<td class="prod_line_y padd3_vv">'.tep_draw_separator('spacer.gif', '1', '1').'</td>';
					}else{ 
					$tableBox_string .= '<td class="prod_line_y padd3_vv">'.tep_draw_separator('spacer.gif', '1', '1').'</td>';} 
					}
			  $tableBox_string .= '    <td';
              if (isset($contents[$i][$x]['align']) && tep_not_null($contents[$i][$x]['align'])) $tableBox_string .= ' align="' . tep_output_string($contents[$i][$x]['align']) . '"';
              if (isset($contents[$i][$x]['params']) && tep_not_null($contents[$i][$x]['params'])) {
                $tableBox_string .= ' ' . $contents[$i][$x]['params'];
              } elseif (tep_not_null($this->table_data_parameters)) {
                $tableBox_string .= ' ' . $this->table_data_parameters;
              }
			  if ($i >= 1)	{
              $tableBox_string .= '>'.tep_draw_separator('spacer.gif', '1', '11').'<br>';
			  }else{
			  $tableBox_string .= '>';
			  }
              if (isset($contents[$i][$x]['form']) && tep_not_null($contents[$i][$x]['form'])) $tableBox_string .= $contents[$i][$x]['form'];
			  $tableBox_string .= $contents[$i][$x]['text'];
              if (isset($contents[$i][$x]['form']) && tep_not_null($contents[$i][$x]['form'])) $tableBox_string .= '</form>';
              $tableBox_string .= '</td>  ' . "\n";
            }
          }
        } else {
        $tableBox_string .= '    <td';
        if (isset($contents[$i]['align']) && tep_not_null($contents[$i]['align'])) $tableBox_string .= ' align="' . tep_output_string($contents[$i]['align']) . '"';
        if (isset($contents[$i]['params']) && tep_not_null($contents[$i]['params'])) {
        $tableBox_string .= ' ' . $contents[$i]['params'];
        } elseif (tep_not_null($this->table_data_parameters)) {
          $tableBox_string .= ' ' . $this->table_data_parameters;
          }
          $tableBox_string .= '>' . $contents[$i]['text'] . '</td>' . "\n";
        }
        $tableBox_string .= '  </tr> 	' . "\n";
        if (isset($contents[$i]['form']) && tep_not_null($contents[$i]['form'])) $tableBox_string .= '</form>' . "\n";
      }
      $tableBox_string .= '</table>' . "\n";
      if ($direct_output == true) echo $tableBox_string;
      return $tableBox_string;
    }
  }
// **********************************************************************************************
// ************************ class tableBox_output1
  class contentBox1 extends tableBox_output1 {
    function contentBox1($contents) {
      $info_box_contents = array();
      $info_box_contents[] = array('text' => $this->contentBoxContents($contents));
      $this->table_cellpadding = '0';
      $this->table_parameters = '';
      $this->table_data_parameters = ' class="tableBox_output1_td main"';	  
      $this->tableBox_output1($info_box_contents, true);
    }

    function contentBoxContents($contents) {
      $this->table_cellpadding = '0';
      $this->table_parameters = '';
      return $this->tableBox_output1($contents);
    }
  }
// **********************************************************************************************
// ************************ class infoBox_header  
  class infoBox_header extends tableBox {
    function infoBox_header($contents) {
      $info_box_contents = array();
      $info_box_contents[] = array('text' => $this->infoBoxContents($contents));
      $this->table_cellpadding = '0';
      $this->table_parameters = '';
      $this->tableBox($info_box_contents, true);
    }

    function infoBoxContents($contents) {
      $this->table_cellpadding = '3';
      $this->table_parameters = '';
      $info_box_contents = array();
      for ($i=0, $n=sizeof($contents); $i<$n; $i++) {
        $info_box_contents[] = array(array('align' => (isset($contents[$i]['align']) ? $contents[$i]['align'] : ''),
                                           'form' => (isset($contents[$i]['form']) ? $contents[$i]['form'] : ''),
                                           'params' => '',
                                           'text' => (isset($contents[$i]['text']) ? $contents[$i]['text'] : '')));
      }
      return $this->tableBox($info_box_contents);
    }
  }
// ********************************************************************************************** 
?>
