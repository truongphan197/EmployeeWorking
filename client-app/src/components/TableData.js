import { useState, useEffect, useRef } from 'react';

function TableData(){
    const [data, setData] = useState([]);
    const [loading, setLoading] = useState(true); 

    const hasFetched = useRef(false);
    useEffect(() => {
        if (hasFetched.current) return;
        hasFetched.current = true;

        const fetchData = async () => {
            try {
                const url = new URL('http://localhost:5247/api/EmployeeAttendance');
                url.searchParams.append('startDate', '2025-04-01');
                url.searchParams.append('endDate', '2025-04-29');
              
                const response = await fetch(url.toString());
                if (!response.ok) {
                  throw new Error('Network response was not ok');
                }
                
                const jsonData = await response.json();
                console.log('jsonData',jsonData);
                setData(jsonData);  
            } catch (error) {
                console.log('loi');
            } finally {
                setLoading(false); 
              }

        };
        fetchData();
    }, []);

    const handleExportExcel = async () => {
      const urlExport = new URL('http://localhost:5247/api/EmployeeAttendance/export-excel');
      urlExport.searchParams.append('startDate', '2025-04-01');
      urlExport.searchParams.append('endDate', '2025-04-29');
      const response = await fetch(urlExport.toString(), {
        method: 'GET',
        headers: {
            'Accept': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        },
      });
      const blob = await response.blob();
      const url = window.URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = 'report.xlsx';
      a.click();
      window.URL.revokeObjectURL(url);
    };

    if (loading) {
        return <div>Đang tải dữ liệu...</div>;
      }
    
      if (!data) {
        return <div>Không có dữ liệu</div>;
      }     
    return(
        <div className="container mt-4">
        <table className="table table-striped table-bordered table-hover">
          <thead className="table-dark">
            <tr>
      {data.listTitle.map((item, index) => (
        <th>{item}</th>
      ))}               
            </tr>
          </thead>
          <tbody>
          {data.listData.map((item, index) => (
        <tr>{
          item.map(item2 => {
            return <td>{item2}</td>
          })
          }</tr>
      ))}               
          </tbody>
        </table>
        <button className="btn btn-primary" onClick={handleExportExcel}>Export excel</button>
      </div>
    );
}

export default TableData;